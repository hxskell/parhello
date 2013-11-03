all: test

test: parhello.beam
	erl -noshell -s parhello

parhello.beam: parhello.erl
	erlc -Wall parhello.erl

clean:
	-rm *.beam
