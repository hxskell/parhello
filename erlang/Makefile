all: test

test: parhello.beam
	erl -noinput -s parhello main foo -s init stop

parhello.beam: parhello.erl
	erlc parhello.erl

clean:
	-rm *.beam