all: test

test: parhello
	-killall parhello
	./parhello speaker localhost 8081 &
	./parhello speaker localhost 8082 &
	./parhello master localhost 8080

parhello: parhello.hs
	ghc -O2 -Wall --make parhello.hs -package distributed-process -package distributed-process-simplelocalnet -threaded

lint:
	hlint .

clean:
	-rm parhello
	-rm *.hi
	-rm *.o
