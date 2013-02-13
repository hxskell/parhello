all: test

test: parhello
	./parhello +RTS

parhello: parhello.hs
	ghc -package parallel-io -threaded parhello.hs -o parhello

clean:
	-rm parhello
	-rm *.hi
	-rm *.o