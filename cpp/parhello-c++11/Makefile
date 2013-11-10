CC=g++
FLAGS=-O2 -Wall -Wextra -Weffc++

LINK_OPTIONS=

ifeq ("${MSYSTEM}", "MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
else
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		CC=clang++
		FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything -Wno-c++98-compat
	endif
endif

all: test

test: parhello-c++11
	./parhello-c++11

parhello-c++11: parhello-c++11.cpp
	$(CC) $(FLAGS) -std=c++11 -stdlib=libc++ $(LINK_OPTIONS) -o parhello-c++11 parhello-c++11.cpp

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem .

cpplint:
	cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright *.cpp *.h

lint: cppcheck

clean:
	-rm parhello-c++11
