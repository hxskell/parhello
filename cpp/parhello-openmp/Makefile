all: test

test: parhello-openmp
	./parhello-openmp

parhello-openmp: parhello-openmp.cpp
	g++ -O2 -Wall -fopenmp -o parhello-openmp parhello-openmp.cpp

lint:
	cppcheck *.cpp *.h

clean:
	-rm *.exe
	-rm parhello-openmp
