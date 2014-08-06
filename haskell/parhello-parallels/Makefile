BIN=bin/parhello

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is ParHello

all: test

test: $(BIN)
	$(BIN) +RTS -N

$(BIN): ParHello.hs
	mkdir -p bin/
	ghc $(FLAGS) ParHello.hs -threaded -package parallel-io

lint:
	hlint .

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
