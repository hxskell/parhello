CC=gcc-4.7

all: test

test: parhello
	./parhello

parhello: parhello.c
	$(CC) -fopenmp -o parhello -O2 parhello.c -Wall

lint:
	splint *.c *.h

clean:
	-rm parhello
