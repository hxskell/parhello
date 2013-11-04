all: test

test: parhello-openmp
	./parhello-openmp

parhello-openmp: parhello-openmp.cpp
	g++ -O2 -Wall -Wextra -fopenmp -o parhello-openmp parhello-openmp.cpp

lint:
	cppcheck .

clean:
	-rm *.exe
	-rm parhello-openmp
