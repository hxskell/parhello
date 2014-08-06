BIN=bin/parhello

all: test

test: $(BIN)
	-killall parhello
	$(BIN) speaker localhost 8081 &
	$(BIN) speaker localhost 8082 &
	$(BIN) master localhost 8080

$(BIN): parhello.hs
	mkdir -p bin/
	ghc -O2 -Wall -fwarn-tabs --make parhello.hs -o $(BIN) -package distributed-process -package distributed-process-simplelocalnet -threaded

lint:
	hlint .

clean:
	-rm -rf bin/
	-rm *.hi
	-rm *.o
