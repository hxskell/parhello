all: parhello-openmp

parhello-openmp: parhello-openmp.cpp
	g++ -fopenmp -o parhello-openmp parhello-openmp.cpp

test: parhello-openmp
	./parhello-openmp

lint:
	cppcheck *.cpp *.h

clean:
	-rm parhello-openmp
