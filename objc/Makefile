FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o parhello

BIN=parhello

all: test

test: $(BIN)
	./$(BIN)

$(BIN): parhello.m
	clang $(FLAGS) parhello.m

lint: $(BIN)
	oclint parhello.m -- $(FLAGS)

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
