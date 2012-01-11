-module(ircproxy).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

% SASL's boot module wants to start things this way
start() -> application:start(?MODULE).

start(_StartType, _StartArgs) ->
    ircproxy_sup:start_link().

stop(_State) ->
    ok.
