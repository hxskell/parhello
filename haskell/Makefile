all: parhello

parhello: parhello.hs
	ghc -package parallel-io -threaded parhello.hs -o parhello

test: parhello
	./parhello +RTS

clean:
	-rm parhello
