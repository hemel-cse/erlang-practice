-module(qrs).
-compile(export_all).


to_q(L,DB) ->
	io:format("#~p",[DB]),
	tail_len(L).


tail_len(L) -> 
	io:format("{"),
	tail_len(L,[]).
 
tail_len([], Acc) -> io:format("}");

tail_len([H|T], Acc) -> 
	io:format("~p=~p",[element(1,H),element(2,H)]),
	case T =:= [] of
		true ->
			io:format("");
		false ->
			io:format(",")
	end,
	tail_len(T,Acc).

