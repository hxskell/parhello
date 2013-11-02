CC=gcc-4.7

all: test

test: parhello
	./parhello

parhello: parhello.c
	$(CC) -fopenmp -o parhello parhello.c -Wall

lint:
	splint *.c *.h

clean:
	-rm parhello
