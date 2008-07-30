-module(bc).


-import(gen_tcp).
-import(lists).
-import(xmerl_scan).


-export([init/1,subscribe/2,receive_msg/1,receive_loop/2,go/0]).


-include("xmerl.hrl").


loop() ->
	receive 
		{_From, Data} -> 
			%io:format("go: Result (~p)~n",[Data]),
			{value, {_, Text}} = lists:keysearch('TextPayload',1,Data),
			io:format("go: Result text (~s)~n",[Text]),
			loop()
	end
.


go() ->
	%{ok,F} =init([{msg_type,'TOPIC_AS_QUEUE'},{host,"ejabberd1.m3.bk.sapo.pt"}]),
	{ok,F} =init([{msg_type,'TOPIC'},{host,"10.135.5.110"}]),
	subscribe(F,["/sapo/messenger/raw/sessions", "/sapo/messenger/raw/presences"]),
	%X= receive_msg(F),
	%io:format("go: Result (~p)~n",[X])

	Pid = spawn(fun loop/0),
	receive_loop(F,Pid)
.


init(Conf) when is_list(Conf) -> 
	case msg_type(Conf) of
		{ok, MType} ->
			case lists:keysearch(host,1,Conf) of
				{value, {_, Host}} -> Host;
				_ -> Host = "localhost"
			end,

			case lists:keysearch(port,1,Conf) of
				{value, {_, Port}} -> Port;
				_ -> Port = 3322
			end,

			case lists:keysearch(timeout,1,Conf) of
				{value, {_, Timeout}} -> Timeout;
				_ -> Timeout = 10000
			end,

			case gen_tcp:connect(
					Host, Port, [binary, {packet, 4}, {active,false}], Timeout) of
				{ok, Socket} -> {ok, {Socket, MType, Timeout}};
				{_, X}  -> {error, X}
			end;
		
		X -> X 
	end
.		


subscribe({Socket, [MType|Dest], Timeout}, [H|T]) -> 
	case MType of 
		'TOPIC_AS_QUEUE' -> RDest = Dest ++ "@" ++ H;
		_ -> RDest = H
	end,
	
	Msg = "<soapenv:Envelope xmlns:soapenv='http://www.w3.org/2003/05/soap-envelope'><soapenv:Body>
<Notify xmlns='http://services.sapo.pt/broker'><DestinationName>" ++ 
RDest ++ "</DestinationName><DestinationType>" ++ 
atom_to_list(MType) ++ "</DestinationType></Notify></soapenv:Body></soapenv:Envelope>",
    
	case gen_tcp:send(Socket,Msg) of
		ok -> subscribe({Socket, [MType|Dest], Timeout}, T);
		What -> 
			io:format("subscribe: send failed ~p~n",[What]),
			What
	end;

subscribe(_, []) -> [].


receive_msg({Socket,_, Timeout}) -> 
	%io:format("recv: timeout ~p~n",[Timeout]),

	case gen_tcp:recv(Socket,0,Timeout) of
		{ok, Data} -> 
			{XML, _} = xmerl_scan:string(binary_to_list(Data)),
			find_elements(
				['TextPayload', 'MessageId', 'DestinationName' ],XML#xmlElement.content);

		{error, closed } -> []
	end
.


receive_loop(X,Pid) when is_pid(Pid) -> 
	receive_loop(X,fun(Data) -> Pid ! {self(), Data} end)
;

receive_loop({Socket,X, Timeout}, F) -> 
	%io:format("recv: timeout ~p~n",[Timeout]),
	case gen_tcp:recv(Socket,0,Timeout) of
		{ok, Data} -> 
			{XML, _} = xmerl_scan:string(binary_to_list(Data)),
			F(find_elements(
				['TextPayload', 'MessageId', 'DestinationName'], XML#xmlElement.content)),
		
			receive_loop({Socket,X, Timeout},F);
			
		{error, closed} -> [];
		
		{error, _} ->
			receive_loop({Socket,X, Timeout},F)
	end
.


msg_type(Conf) ->
	case lists:keysearch(msg_type,1,Conf) of
		{ value, { _, V } } -> 
			case lists:member(V,['TOPIC','TOPIC_AS_QUEUE']) of
				true -> 
					case V of
						'TOPIC_AS_QUEUE' ->
							case lists:keysearch(hostname,1,Conf) of
								{value, {_, Hostname}} -> Hostname;
								_ -> {_, Hostname} = inet:gethostname()
							end,
							{ok, [V, Hostname]};
						_ -> {ok, [V] }
					end;
					
				false -> {error, einval}
			end;
			
		_ -> {ok, 'TOPIC'}
	end
.


find_elements(Taglist,L) ->
	find_elements(Taglist,L,[])
.

	
find_elements([H|T],L,Res) ->
	find_elements(T,L,find_element(H,L,Res))
;

find_elements([],_,Res) -> Res
.


find_element(Tag,[X|T],Res) ->
	%io:format("find_element: TAG ~p~n",[Tag]),
	case is_record(X,xmlElement) of
		true -> 
			%io:format("find_element: IS ELEMENT name ~p~n",[X#xmlElement.name]),
			case string:str(atom_to_list(X#xmlElement.name),atom_to_list(Tag)) of
				%regexp:first_match(atom_to_list(X#xmlElement.name),atom_to_list(Tag)) of
				0 ->
					case find_element(Tag,X#xmlElement.content,Res) of 
						Res -> find_element(Tag,T,Res);
						Y -> Y
					end;

				_ -> 
					%io:format("find_element: IS ELEMENT found ~p~n",[Tag]),
					[{ Tag, text_content(X#xmlElement.content,[]) } | Res ]
					
			end;
		_ -> 	
			%io:format("find_element: case 3~n",[]),
			find_element(Tag,T,Res)
	end
;	

find_element(_,[],Res) -> Res
.


text_content([X|T],Res) ->
	case is_record(X,xmlText) of
		true -> 
			text_content(T,lists:append(Res,X#xmlText.value));
		false -> 	
			text_content(T,Res)
	end
;	

text_content([],Res) -> Res
.


