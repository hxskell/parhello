all: test

test: parhello.pl
	perl parhello.pl

lint:
	-perlcritic . | grep -v "source OK"
