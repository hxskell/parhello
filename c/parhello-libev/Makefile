CC=gcc-4.7
FLAGS=-O2 -Wall -Wextra

all: test

test: parhello
	./parhello

parhello: parhello.c
	$(CC) $(FLAGS) -o parhello parhello.c -lev

splint:
	find . -type f -name '*.c' -exec splint {} \;
	find . -type f -name '*.h' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -exec vera++ -s {} \;
	find . -type f -name '*.c' -exec vera++ -s {} \;
	find . -type f -name '*.h' -exec vera++ -s {} \;

lint: splint vera++

clean:
	-rm *.exe
	-rm parhello
