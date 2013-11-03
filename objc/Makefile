all: test

test: parhello
	./parhello

parhello: parhello.m
	clang -Wall -Wextra -Wmost -framework Foundation -lobjc -o parhello parhello.m

clean:
	-rm *.exe
	-rm parhello
