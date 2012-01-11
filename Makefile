REBAR=./rebar

all:
	${REBAR} compile
test:
	${REBAR} compile eunit
start:
	erl -pa ebin -boot start_sasl -s irc_app
debug:
	erl -pa ebin
