CC=g++-4.7
FLAGS=-O2 -Wall -Wextra -Weffc++

all: test

test: parhello-openmp
	./parhello-openmp

parhello-openmp: parhello-openmp.cpp
	$(CC) $(FLAGS) -fopenmp -o parhello-openmp parhello-openmp.cpp

lint:
	cppcheck --enable=all --suppress=missingIncludeSystem .

clean:
	-rm *.exe
	-rm parhello-openmp
