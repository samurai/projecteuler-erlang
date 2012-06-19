-module(utilz).
-export([timeit/2,timeit/3,poopoo/2]).

%Time how long a function runs
%TODO: For now i believe the timing will overflow after ~27 hours =\
%TODO: Support for more than one argument

timeit(Func,Arg) ->
	Start = now(),
	Result = Func(Arg),
	io:format("~p",[Result]),
	Stop = now(),
	{_,St,_} = Start,
	{_,Sp,_} = Stop,
	Elapsed = Sp-St,
	io:format("~n~nTime elapsed: ~p (seconds)~n~n",[Elapsed]).

timeit(Func,Arg, Arg2) ->
	Start = now(),
	Result = Func(Arg,Arg2),
	io:format("~p",[Result]),
	Stop = now(),
	{_,St,_} = Start,
	{_,Sp,_} = Stop,
	Elapsed = Sp-St,
	io:format("~n~nTime elapsed: ~p (seconds)~n~n",[Elapsed]).

%%yes, this function is simply here because erlang allows me to draw arses doing #2
%%pass 2 of anything to this function and you get an empty list (nothing) back
poopoo(_,_) ->
	[].
