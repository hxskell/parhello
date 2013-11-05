all: test

test: parhello-openmp
	./parhello-openmp

parhello-openmp: parhello-openmp.cpp
	g++ -O2 -Wall -Wextra -Weffc++ -fopenmp -o parhello-openmp parhello-openmp.cpp

lint:
	cppcheck --enable=all --suppress=missingIncludeSystem .

clean:
	-rm *.exe
	-rm parhello-openmp
