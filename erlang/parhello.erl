-module(parhello).
-author("andrew.pennebaker@gmail.com").
-export([counter/1, hello/1, start/0]).

counter(0) -> init:stop();
counter(N) ->
  receive
    I -> counter(N - I)
  end.

hello(Counter) ->
  receive
    C ->
      io:format("~c", [C]),
      Counter ! 1
  end.

start() ->
  Message = "Hello World!\n",
  Counter = spawn(parhello, counter, [length(Message)]),
  [ spawn(parhello, hello, [Counter]) ! C ||
    C <- Message ].
