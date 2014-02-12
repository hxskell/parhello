all: test

test: parhello
	./parhello +RTS -N

parhello: parhello.hs
	ghc -O2 -Wall -fwarn-tabs --make -package parallel-io -threaded parhello.hs -o parhello

lint:
	hlint .

clean:
	-rm *.exe
	-rm *.o
	-rm *.hi
	-rm parhello
