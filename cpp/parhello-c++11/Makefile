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
	-rm parhello-c++11
