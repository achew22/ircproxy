-module(irc_server).

-behaviour(gen_server).

%% API
-export([start_link/0, connect/2]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
     terminate/2, code_change/3]).

-record(state, {connection}).

%% API
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

connect(Host, Port) ->
    gen_server:call(?MODULE, {connect, Host, Port}).


%% gen_server callbacks
init([]) ->
    {ok, #state{}}.

handle_call({connect, Host, Port}, _From, _State) ->
	% Connect to the server
	{ok, Connection} = gen_tcp:connect(Host, Port, [binary, {packet, 0}]),
	
    {reply, ok, #state{connection = Connection}};

handle_call(_Msg, _From, State) ->
	{noreply, unknown_command, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, #state{connection = Connection}) ->
	gen_tcp:close(Connection).

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%% Internal functions