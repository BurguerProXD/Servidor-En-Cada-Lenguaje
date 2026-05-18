-module(server).
-export([start/0]).

start() ->
    {ok, Listen} = gen_tcp:listen(8080, [binary, {active, false}]),
    io:format("Erlang server on port 8080~n"),
    accept_loop(Listen).

accept_loop(Listen) ->
    {ok, Socket} = gen_tcp:accept(Listen),
    gen_tcp:send(Socket, "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Erlang"),
    gen_tcp:close(Socket),
    accept_loop(Listen).
