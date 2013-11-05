CC=gcc-4.7
FLAGS=-O2 -Wall -Wextra

all: test

test: parhello
	./parhello

parhello: parhello.c
	$(CC) $(FLAGS) -fopenmp -o parhello parhello.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm parhello
