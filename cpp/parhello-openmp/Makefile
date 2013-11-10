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
	cpplint --filter=-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright *.cpp *.h

lint: cppcheck

clean:
	-rm *.exe
	-rm parhello-openmp
