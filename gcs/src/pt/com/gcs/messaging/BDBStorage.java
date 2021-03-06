package pt.com.gcs.messaging;

import java.util.concurrent.atomic.AtomicBoolean;

import org.caudexorigo.ErrorAnalyser;
import org.caudexorigo.Shutdown;
import org.caudexorigo.concurrent.Sleep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import pt.com.broker.types.CriticalErrors;
import pt.com.broker.types.ForwardResult;
import pt.com.broker.types.ForwardResult.Result;
import pt.com.broker.types.NetMessage;
import pt.com.gcs.messaging.serialization.MessageMarshaller;

import com.sleepycat.bind.ByteArrayBinding;
import com.sleepycat.bind.tuple.LongBinding;
import com.sleepycat.je.Cursor;
import com.sleepycat.je.Database;
import com.sleepycat.je.DatabaseConfig;
import com.sleepycat.je.DatabaseEntry;
import com.sleepycat.je.DatabaseException;
import com.sleepycat.je.Environment;
import com.sleepycat.je.LockConflictException;
import com.sleepycat.je.OperationStatus;

/**
 * BDBStorage encapsulates database access logic.
 * 
 */

public class BDBStorage
{
	private static Logger log = LoggerFactory.getLogger(BDBStorage.class);

	private static final int MAX_REDELIVERY_PER_MESSAGE = 3;

	private Environment env;

	private Database messageDb;

	private String primaryDbName;

	private QueueProcessor queueProcessor;

	private final AtomicBoolean isMarkedForDeletion = new AtomicBoolean(false);

	public BDBStorage(QueueProcessor qp)
	{
		try
		{
			if (isMarkedForDeletion.get())
				return;
			queueProcessor = qp;
			primaryDbName = queueProcessor.getQueueName();

			env = BDBEnviroment.get();

			DatabaseConfig dbConfig = new DatabaseConfig();
			dbConfig.setTransactional(false);
			dbConfig.setAllowCreate(true);
			dbConfig.setSortedDuplicates(false);
			dbConfig.setBtreeComparator(BDBMessageComparator.class);
			messageDb = env.openDatabase(null, primaryDbName, dbConfig);

			log.info("Storage for queue '{}' is ready.", queueProcessor.getQueueName());
		}
		catch (Throwable t)
		{
			dealWithError(t, false);
			Shutdown.now();
		}
	}

	private DatabaseEntry buildDatabaseEntry(BDBMessage bdbm)
	{
		DatabaseEntry data = new DatabaseEntry();
		ByteArrayBinding bab = new ByteArrayBinding();

		byte[] marshallBDBMessage = MessageMarshaller.marshallBDBMessage(bdbm);
		if (marshallBDBMessage != null)
		{
			bab.objectToEntry(marshallBDBMessage, data);
			return data;
		}
		else
		{
			throw new RuntimeException("MessageMarshaller.marshallBDBMessage returned null");
		}
	}

	private void closeDatabase(Database db)
	{
		try
		{
			
			String dbName = db.getDatabaseName();
			log.debug("Try to close db '{}'", dbName);
			db.close();
			log.debug("Closed db '{}'", dbName);
		}
		catch (Throwable t)
		{
			dealWithError(t, false);
		}
	}

	private void closeDbCursor(Cursor msg_cursor)
	{
		if (msg_cursor != null)
		{
			try
			{
				msg_cursor.close();
			}
			catch (Throwable t)
			{
				dealWithError(t, false);
			}
		}
	}

	private void cursorDelete(Cursor msg_cursor) throws DatabaseException
	{
		msg_cursor.delete();
		queueProcessor.decrementQueuedMessagesCount();
	}

	private void dealWithError(Throwable t, boolean rethrow)
	{
		Throwable rt = ErrorAnalyser.findRootCause(t);
		log.error(rt.getMessage(), rt);
		CriticalErrors.exitIfCritical(rt);
		if (rethrow)
		{
			throw new RuntimeException(rt);
		}
	}

	private void removeDatabase(String dbName)
	{
		int retryCount = 0;

		while (retryCount < 5)
		{
			try
			{
				log.debug("Try to remove db '{}'", dbName);
				env.truncateDatabase(null, dbName, false);
				env.removeDatabase(null, dbName);
				log.debug("Storage for queue '{}' was removed", queueProcessor.getQueueName());

				break;
			}
			catch (Throwable t)
			{
				retryCount++;
				log.error(t.getMessage());
				Sleep.time(2500);
			}
		}
	}

	protected long count()
	{
		if (isMarkedForDeletion.get())
			return 0;

		try
		{
			return messageDb.count();
		}
		catch (DatabaseException e)
		{
			dealWithError(e, false);
			return 0;
		}
	}

	protected boolean deleteMessage(String msgId)
	{
		if (isMarkedForDeletion.get())
			return false;

		DatabaseEntry key = new DatabaseEntry();
		long k = Long.parseLong(msgId.substring(33));
		LongBinding.longToEntry(k, key);

		int count = 5;
		LockConflictException lastDeadlockException = null;
		do
		{
			try
			{
				OperationStatus op = messageDb.delete(null, key);

				if (op.equals(OperationStatus.SUCCESS))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch (LockConflictException de)
			{
				--count;
				lastDeadlockException = de;
				log.error("DeadlockException. Number of retries left: " + count, de);
			}
			catch (DatabaseException e)
			{
				dealWithError(e, true);
				return false;
			}
		}
		while (count != 0);

		// Stop trying to deal with DeadlockException
		dealWithError(lastDeadlockException, true);

		return false;
	}

	protected void deleteQueue()
	{
		isMarkedForDeletion.set(true);
		closeDatabase(messageDb);
		removeDatabase(primaryDbName);
		//BDBEnviroment.sync();
	}

	protected long getLastSequenceValue()
	{
		if (isMarkedForDeletion.get())
			return 0L;

		Cursor msg_cursor = null;
		long seqValue = 0L;

		try
		{
			msg_cursor = messageDb.openCursor(null, null);

			DatabaseEntry key = new DatabaseEntry();
			DatabaseEntry data = new DatabaseEntry();

			msg_cursor.getLast(key, data, null);

			seqValue = LongBinding.entryToLong(key);
		}
		catch (Throwable t)
		{
			dealWithError(t, false);
		}
		finally
		{
			closeDbCursor(msg_cursor);
		}
		return seqValue;
	}

	// public String insert(NetMessage nmsg, long sequence, boolean preferLocalConsumer)

	public void insert(BDBMessage bdbm)
	{
		if (!isMarkedForDeletion.get())
		{
			try
			{

				DatabaseEntry key = new DatabaseEntry();
				DatabaseEntry data = buildDatabaseEntry(bdbm);

				LongBinding.longToEntry(bdbm.getSequence(), key);

				if (messageDb.put(null, key, data) != OperationStatus.SUCCESS)
				{
					String msg = String.format("Failed to insert message in queue '%s'", this.queueProcessor.getQueueName());
					throw new RuntimeException(msg);
				}
			}
			catch (Throwable t)
			{
				dealWithError(t, true);
			}
		}
	}

	protected AtomicBoolean recoveryRunning = new AtomicBoolean(false);

	protected long recoverMessages()
	{
		if (isMarkedForDeletion.get())
			return 0l;

		boolean wasRunning = recoveryRunning.getAndSet(true);
		if (wasRunning)
		{
			// We shouldn't be here
			return 0l;
		}

		long now = System.currentTimeMillis();

		long nextCycle = Long.MAX_VALUE;

		int i0 = 0; // delivered
		int j0 = 0; // failed delivery
		int k0 = 0; // redelivered messages
		int e0 = 0; // expired messages
		int a0 = 0; // delivered messages that don't require ACK

		Cursor msg_cursor = null;

		try
		{
			msg_cursor = messageDb.openCursor(null, null);

			DatabaseEntry key = new DatabaseEntry();
			DatabaseEntry data = new DatabaseEntry();

			while ((msg_cursor.getNext(key, data, null) == OperationStatus.SUCCESS))
			{
				if (isMarkedForDeletion.get())
					break;

				byte[] bdata = data.getData();

				BDBMessage bdbm = null;
				NetMessage nmsg = null;

				try
				{
					bdbm = MessageMarshaller.unmarshallBDBMessage(bdata);
					if (bdbm == null)
					{
						log.info("MessageMarshaller.unmarshallBDBMessage returned null");
						continue;
					}
					nmsg = bdbm.getMessage();
				}
				catch (Throwable e)
				{
					log.error(e.getMessage(), e);
					cursorDelete(msg_cursor);
					continue;
				}

				boolean preferLocalConsumer = bdbm.getPreferLocalConsumer();
				long reserveTimeout = bdbm.getReserveTimeout();
				final boolean isReserved = reserveTimeout > now;

				if (!isReserved)
				{
					long deferredDelivery = nmsg.getAction().getNotificationMessage().getMessage().getDeferredDelivery();

					if (deferredDelivery > now)
					{
						long diff = deferredDelivery - now;

						if (diff < nextCycle)
						{
							nextCycle = diff;
						}

						continue;
					}

					if (now > nmsg.getAction().getNotificationMessage().getMessage().getExpiration())
					{
						cursorDelete(msg_cursor);
						e0++;
					}
					else
					{
						try
						{
							bdbm.setPreferLocalConsumer(false);

							int tries = 0;
							// long reserveTime = -1;

							ForwardResult result = null;

							do
							{
								result = queueProcessor.forward(nmsg, preferLocalConsumer);
								preferLocalConsumer = false;
								++tries;
							}
							while ((result.result == Result.FAILED) && (tries != MAX_REDELIVERY_PER_MESSAGE));

							if (result.result == Result.FAILED)
							{
								++j0;
								break;
							}
							else
							{
								if (bdbm.getReserveTimeout() != 0)
								{
									++k0; // It's a re-delivery
									queueProcessor.getQueueStatistics().newQueueRedeliveredMessage();
								}

								if (result.result == Result.SUCCESS)
								{
									long time = result.time;
									bdbm.setReserveTimeout(now + result.time);

									msg_cursor.putCurrent(buildDatabaseEntry(bdbm));
									++i0;

									if (time < nextCycle)
									{
										nextCycle = time;
									}
								}
								else
								{
									// result is Result.NOT_ACKNOWLEDGE
									cursorDelete(msg_cursor);
									++a0;
								}
							}
						}
						catch (Throwable t)
						{
							log.error("Error recovering messages", t);
							t.printStackTrace();
							break;
						}
					}
				}
			}

			if (log.isDebugEnabled())
			{
				log.debug(String.format("Queue '%s' processing summary; Delivered: %s; Failed delivery: %s; Expired: %s; Pre ack'ed: %s; Redelivered: %s", queueProcessor.getQueueName(), i0, j0, e0, a0, k0));
			}
			else
			{
				if ((e0 + k0) > 0)
				{
					log.warn(String.format("Queue '%s' processing summary; Expired: %s; Redelivered: %s", queueProcessor.getQueueName(), e0, k0));
				}
			}
		}
		catch (Throwable t)
		{
			dealWithError(t, false);
		}
		finally
		{
			closeDbCursor(msg_cursor);
		}
		recoveryRunning.set(false);
		return (nextCycle != Long.MAX_VALUE) ? nextCycle : 0l;
	}

	public void deleteExpiredMessages()
	{
		if (isMarkedForDeletion.get())
			return;

		if (recoveryRunning.get())
		{
			// try later
			return;
		}

		log.info("Deleting expired messages for queue '{}'.", queueProcessor.getQueueName());

		long now = System.currentTimeMillis();

		int e0 = 0; // expired messages

		Cursor msg_cursor = null;

		try
		{
			msg_cursor = messageDb.openCursor(null, null);

			DatabaseEntry key = new DatabaseEntry();
			DatabaseEntry data = new DatabaseEntry();

			while ((msg_cursor.getNext(key, data, null) == OperationStatus.SUCCESS))
			{
				if (isMarkedForDeletion.get())
					break;

				byte[] bdata = data.getData();

				BDBMessage bdbm = null;
				NetMessage msg = null;

				try
				{
					bdbm = MessageMarshaller.unmarshallBDBMessage(bdata);
					if (bdbm == null)
					{
						log.info("MessageMarshaller.unmarshallBDBMessage returned null");
						continue;
					}
					msg = bdbm.getMessage();
				}
				catch (Throwable e)
				{
					cursorDelete(msg_cursor);
					continue;
				}

				long reserveTimeout = bdbm.getReserveTimeout();
				final boolean isReserved = reserveTimeout > now;

				if (!isReserved)
				{
					if (now > msg.getAction().getNotificationMessage().getMessage().getExpiration())
					{
						cursorDelete(msg_cursor);
						e0++;
						queueProcessor.getQueueStatistics().newQueueExpiredMessage();
					}
				}
			}
			if (e0 > 0)
			{
				log.warn("Number of expired messages for queue '{}': {}", queueProcessor.getQueueName(), e0);
			}
		}
		catch (Throwable t)
		{
			dealWithError(t, false);
		}
		finally
		{
			closeDbCursor(msg_cursor);
		}
	}
}