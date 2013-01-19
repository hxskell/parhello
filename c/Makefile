all: parhello

parhello: parhello.hs
	gcc -fopenmp -o parhello parhello.c

test: parhello
	./parhello

clean:
	-rm parhello
