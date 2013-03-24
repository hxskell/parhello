all: test

test: parhello
	./parhello

parhello: parhello.oz
	ozc -x parhello.oz

clean:
	-rm parhello
	-rm *.exe
