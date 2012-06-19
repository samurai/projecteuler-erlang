-module(problem2).
-export([run/2,run/3]).

%%solution to project euler #2 - generating fibanici's and summing them up
%%run this as problem2:run(1,2) to solve the challenge, will work with other inputs as well

run(A,B) -> %%this is mostly for a cleaner implementation, no need to pass in 0 or somesuch
	if  %%these if's are really haxy, im not sure it's the proper way to do this =\
		A rem 2 == 0 ->
			SumA = A;
		true ->
			SumA =  0
	end,
	if
		B rem 2 == 0 ->
			SumB = B;
		true ->
			SumB = 0
	end,
	io:format("Starting with ~p, ~p and sum ~p~n",[A,B,SumA+SumB]),
	run(A,B,SumA+SumB).
run(A,B,Sum) ->
	Tmp = A+B,
	io:format("Doing ~p~n",[Sum]),
	if Tmp > 4000000 ->
		io:format("~p~n",[Sum]);
	Tmp rem 2 == 0 ->
		run(B,Tmp,Sum+Tmp);
	Tmp rem 2 == 1 ->
		run(B,Tmp,Sum)
	end.
	

