-module(parhello).
-author("andrew.pennebaker@gmail.com").
-export([hello/1, start/1, start/0]).

-import(lists, [map/2]).

hello(C) ->
	io:format("~c", [C]).

start(_) -> start().

start() ->
	lists:map(fun(C) -> spawn(parhello, hello, [C]) end, "Hello World!\n").