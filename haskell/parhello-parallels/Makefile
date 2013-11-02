all: test

test: parhello
	./parhello +RTS -N

parhello: parhello.hs
	ghc -package parallel-io -threaded parhello.hs -o parhello -Wall

lint:
	hlint .

clean:
	-rm parhello
	-rm *.hi
	-rm *.o
