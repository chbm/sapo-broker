package pt.com.broker.monitorization.db.queries;

import java.util.List;
import java.util.Map;

public class AgentInformationRouter implements QueryDataProvider
{
	private static final AllAgentsGeneralInfoQuery ALL_AGENTS_GENERAL_INFO = new AllAgentsGeneralInfoQuery();
	private static final AgentMiscInformationQuery AGENT_MISC_INFO = new AgentMiscInformationQuery(); 
	
	private static String AGENTNAME_PARAM = "agentname";
	
	private static final String TYPE = "agent";
	
	public String getData(String queryType, Map<String, List<String>> params)
	{
		List<String> list = params.get(AGENTNAME_PARAM);
		if(list != null && list.size() != 0)
		{
			return AGENT_MISC_INFO.getJsonData(params);
		}
		
		return ALL_AGENTS_GENERAL_INFO.getJsonData(params);
	}
	
	@Override
	public String getType()
	{
		return TYPE;
	}
}
