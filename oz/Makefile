BIN=bin/parhello

all: test

test: $(BIN)
	$(BIN)

$(BIN): parhello.oz
	mkdir -p bin/
	ozc -x -o $(BIN) parhello.oz

clean:
	-rm -rf bin/
