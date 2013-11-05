CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything

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
