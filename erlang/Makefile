all: test

test: compile
	erl -noshell -s parhello

compile: parhello.erl
	erlc -Wall +debug_info parhello.erl

~/.dialyzer_plt: compile
	dialyzer *.beam --build_plt --quiet

lint: ~/.dialyzer_plt
	dialyzer *.beam

clean:
	-rm *.beam
