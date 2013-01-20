all: test

test: parhello.exe
	mono parhello.exe

parhello.exe: ParHello.fs
	fsharpc --nologo --out:parhello.exe ParHello.fs

clean:
	-rm *.exe