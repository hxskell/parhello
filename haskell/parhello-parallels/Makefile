BIN=parhello

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is ParHello

all: test

test: $(BIN)
	./$(BIN) +RTS -N

$(BIN): ParHello.hs
	ghc $(FLAGS) ParHello.hs -threaded -package parallel-io

lint:
	hlint .

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
