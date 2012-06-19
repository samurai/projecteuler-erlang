-module(problem4). 
-import(string).
-export([reverse/1,ispalindrom/1,test/3,test/0]).

test() ->
	problem4:test(999,999,0).

test(Number1, Number2,Max) ->
	%%holy republicans batman!
	Palin = element(1,string:to_integer(problem4:ispalindrom(erlang:integer_to_list(Number1 * Number2)))),
	if 
		Palin /= 0 ->
			io:format("~p * ~p = ~p~n",[Number1, Number2, Palin]),
			Newmax = Palin;
		true ->
			Newmax = Max
	end,
	if
		Number2 =< 99 ->
			test(Number1 - 1, 999, erlang:max(Max,Newmax));
		(Number1 =< 99) and (Number2 =< 100) ->
			io:format("Max: ~p~n",[Max]),
			Max;
		true ->
			test(Number1, Number2 - 1,erlang:max(Max,Newmax))
	end.

ispalindrom(String) ->
	Revstring = lists:reverse(String),
	if
		Revstring == String ->
			String;
		true ->
			"0"
	end.

%%way to reinvent the wheel.... lists:reverse("abc") ftw
reverse([]) ->
	[];
reverse(String) ->
	Head = string:substr(String,1,1),
	Tail = string:substr(String,2),
	io:format("[~s|~s]~n",[Head,Tail]),
	reverse(Tail) ++ Head.


test2(Number) ->
	io:format("Finding the prime factors of ~p - method2~n",[Number]),
	factor2(Number,(Number div 2)).

test3(Number) ->
	io:format("Finding the prime factors of ~p - method3~n",[Number]),
	factor3(Number,2).

validate(Function,Stop) when Stop > 0->
	Factors = Function(Stop),
	io:format("Factors: ~p~n",[Factors]),
	Answer = multiplyList(Factors,1),
	if
		Answer == Stop ->
			validate(Function,Stop-1);
		true ->
			io:format("Function failed for ~p~nWith factors found ~p~n",[Stop,Factors])
	end;
validate(_,_) ->
	io:format("Function is valid~n").


multiplyList(List,Sum) ->
	if 
		length(List) > 0 ->
			[Head|Tail] = List,
			multiplyList(Tail,Head*Sum);
		true ->
			Sum
	end.

%%Original factoring function, this one takes a while...
%%Counts backwards
factor(Number,Half)  ->
	if 
		(Half == 1) or (Half == 0)->
			[Number];
		Number rem Half == 0 ->
			io:format("Found one: ~p~n",[Half]),
			[(Number div Half) | factor(Half,(Half div 2))];
		true ->
			factor(Number,Half-1)
	end.

%%pretty much the same as factor1, but for testing if gaurds are faster than if statements... negligable if any difference
factor2(Number,Half) when Half > 1 ->
	if 
		Number rem Half == 0 ->
			io:format("Found one: ~p~n",[Half]),
			[(Number div Half) | factor2(Half,(Half div 2))];
		true ->
			factor2(Number,Half-1)
	end;
factor2(Number,_) ->
	[Number].

%%holy shit this one was fast for the challenge
%%Counts Up
factor3(Number,Counter) when Counter =< Number ->
	if
		Number rem Counter == 0 ->
			io:format("Found one: ~p~n",[Counter]),
			[Counter|factor3((Number div Counter),Counter)]; 
		true ->
			factor3(Number,Counter+1)
	end;
factor3(_,_) ->  
	[].
