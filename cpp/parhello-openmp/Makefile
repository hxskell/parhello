CC=g++-4.7
FLAGS=-O2 -Wall -Wextra -Weffc++

all: test

test: parhello-openmp
	./parhello-openmp

parhello-openmp: parhello-openmp.cpp
	$(CC) $(FLAGS) -fopenmp -o parhello-openmp parhello-openmp.cpp

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem .

cpplint:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.c' -exec splint {} \;

vera++:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec vera++ -s {} \;

lint: cppcheck cpplint splint vera++

valgrind: parhello-openmp
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./parhello-openmp

clean:
	-rm *.exe
	-rm parhello-openmp
