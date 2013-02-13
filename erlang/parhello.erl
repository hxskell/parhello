-module(parhello).
-author("andrew.pennebaker@gmail.com").
-export([hello/0, start/0]).

-import(lists, [map/2]).

hello() ->
	receive
		C -> io:format("~c", [C])
	end.

start() ->
	lists:map(
		fun(C) -> spawn(parhello, hello, []) ! C end,
		"Hello World!\n"
	).
