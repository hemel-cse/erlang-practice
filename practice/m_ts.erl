-module(m_ts).
-compile(export_all).


mts(L,DB) ->
	 qrs:to_q(L,DB).


tail_len(L) -> 
	tail_len(L,[]).
 
tail_len([], Acc) -> Acc;

tail_len([H|T], Acc) -> 
	% R = H,
	% F = fun() ->
	% 		mnesia:write(R)
	% 	end,
	% mnesia:transaction(F),
	io:format("~p",[H]),
	tail_len(T,Acc).