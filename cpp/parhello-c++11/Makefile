CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything -Wno-c++98-compat

LINK_OPTIONS=

ifeq ("${MSYSTEM}", "MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
endif

BIN=bin/parhello-c++11

all: test

test: $(BIN)
	$(BIN)

$(BIN): parhello-c++11.cpp
	mkdir -p bin/
	$(CC) $(FLAGS) -std=c++11 -stdlib=libc++ -lpthread $(LINK_OPTIONS) -o $(BIN) parhello-c++11.cpp

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

cpplint:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck cpplint splint vera++

valgrind: parhello-c++11
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./parhello-c++11

clean:
	-rm -rf bin/
