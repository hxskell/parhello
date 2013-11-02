all: parhello

parhello: parhello.c
	gcc -fopenmp -o parhello parhello.c -Wall

test: parhello
	./parhello

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	-rm parhello
