CC=gcc-4.7
FLAGS=-O2 -Wall -Wextra

all: test

test: parhello
	./parhello

parhello: parhello.c
	$(CC) $(FLAGS) -o parhello parhello.c -lev

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm parhello
