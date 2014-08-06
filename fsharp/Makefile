BIN=bin/parhello.exe

all: test

test: $(BIN)
	mono $(BIN)

$(BIN): ParHello.fs
	mkdir -p bin/
	fsharpc --nologo --out:$(BIN) ParHello.fs

clean:
	-rm -rf bin/
