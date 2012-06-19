-module(problem5).
-export([test/0,divisable/2]).

%%if i ever come back... here are todo's
%%make divisable work for arbitrary Top values

test() ->
	problem5:divisable(1564215,20).




%%this'll check if it meets the requirements, divisble by all numbers between one and Top (20... must be 20)
divisable(Number, 0) ->
	io:format("Found it! = ~p~n",[Number]),
	Number;
divisable(Number, Top) ->
	if
		(Number rem Top) /= 0 ->
			io:format("Testing ~p~n",[Number+1]),
			divisable(Number + 1, 20);
		true ->
			divisable(Number, Top - 1)
	end.
