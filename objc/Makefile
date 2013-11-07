FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o parhello

all: test

test: parhello
	./parhello

parhello: parhello.m
	clang $(FLAGS) parhello.m

lint:
	oclint parhello.m -- $(FLAGS)

clean:
	-rm *.exe
	-rm parhello
