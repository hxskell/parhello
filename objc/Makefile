FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc
LINUX_FLAGS=
FEATURES=-fblocks
LINK_OPTIONS=

ifneq ($(OS),Windows_NT)
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Linux)
		FLAGS=-Wall -lobjc
		LINUX_FLAGS=-I `gnustep-config --variable=GNUSTEP_SYSTEM_HEADERS` -L `gnustep-config --variable=GNUSTEP_SYSTEM_LIBRARIES` -lgnustep-base -fconstant-string-class=NSConstantString -D_NATIVE_OBJC_EXCEPTIONS

		LINK_OPTIONS=-ldispatch -lBlocksRuntime
	endif
endif

BIN=bin/parhello

all: test

test: $(BIN)
	$(BIN)

$(BIN): ParHello.m
	mkdir -p bin/
	clang $(FLAGS) $(LINUX_FLAGS) $(FEATURES) $(LINK_OPTIONS) -o $(BIN) ParHello.m

oclint: $(BIN)
	oclint ParHello.m -- $(FLAGS) -o $(BIN)

astyle-apply:
	-find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[chm]" -exec astyle {} \; | grep -v Unchanged

astyle:
	-find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[chm]" -exec astyle --dry-run {} \; | grep -v Unchanged

clean-astyle:
	-find . -type f -name "*.orig" -exec rm {} \;

lint: oclint astyle

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean: clean-astyle
	-rm -rf bin/
	-rm -rf *.dSYM/
