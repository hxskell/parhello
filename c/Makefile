CC=gcc-4.7

all: test

test: parhello
	./parhello

parhello: parhello.c
	$(CC) -O2 -Wall -fopenmp -o parhello parhello.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm parhello
