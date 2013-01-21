all: test

test: testparhello testhelloactor

testparhello: parhello
	./parhello +RTS

parhello: parhello.hs
	ghc -package parallel-io -threaded parhello.hs -o parhello

testhelloactor: helloactor
	./helloactor +RTS

helloactor: helloactor.hs
	ghc -threaded helloactor.hs -o helloactor

clean:
	-rm parhello
	-rm *.hi
	-rm *.o