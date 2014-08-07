CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything -Wno-source-uses-openmp

BIN=bin/parhello-opemmp

all: test

test: $(BIN)
	$(BIN)

$(BIN): parhello-openmp.cpp
	mkdir -p bin/
	$(CC) $(FLAGS) -fopenmp -o $(BIN) parhello-openmp.cpp

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

cpplint:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck cpplint splint vera++

valgrind: parhello-openmp
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./parhello-openmp

clean:
	-rm -rf bin/
