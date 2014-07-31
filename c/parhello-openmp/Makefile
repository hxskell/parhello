CC=gcc-4.7
FLAGS=-O2 -Wall -Wextra

BIN=parhello

all: test

test: $(BIN)
	./$(BIN)

$(BIN): parhello.c
	$(CC) $(FLAGS) -fopenmp -o $(BIN) parhello.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
