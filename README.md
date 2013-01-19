# parhello - Hello World in a variety of parallel processing languages

# EXAMPLE

	$ cd haskell/
	$ make test
	ghc -package parallel-io -threaded parhello.hs -o parhello
	[1 of 1] Compiling Main             ( parhello.hs, parhello.o )
	Linking parhello ...
	./parhello +RTS
	Hllo World!e
