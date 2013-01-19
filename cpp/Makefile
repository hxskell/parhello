all: parhello

parhello: parhello.cpp
	g++ -fopenmp -o parhello parhello.cpp

test: parhello
	./parhello

clean:
	-rm parhello
