all: test

test: parhello
	./parhello +RTS -N

parhello: parhello.hs
	ghc -package parallel-io -threaded parhello.hs -o parhello

lint:
	hlint .

clean:
	-rm parhello
	-rm *.hi
	-rm *.o
