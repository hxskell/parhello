all: test

test: parhello.beam
	erl -noinput -s parhello -s init stop

parhello.beam: parhello.erl
	erlc parhello.erl

clean:
	-rm *.beam