CC=g++
LINK_OPTIONS=

ifeq ("${MSYSTEM}", "MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
else
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		CC=clang++
	endif
endif

all: parhello-c++11

parhello-c++11: parhello-c++11.cpp
	$(CC) -std=c++11 -stdlib=libc++ $(LINK_OPTIONS) -o parhello-c++11 parhello-c++11.cpp

test: parhello-c++11
	./parhello-c++11

clean:
	-rm parhello-c++11
