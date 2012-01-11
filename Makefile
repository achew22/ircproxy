REBAR=./rebar

all:
	${REBAR} compile
test:
	${REBAR} compile eunit
clean:
	${REBAR} clean
start:
	erl -pa ./ebin -boot start_sasl -s ircproxy
debug:
	erl -pa ./ebin
console:
	make debug