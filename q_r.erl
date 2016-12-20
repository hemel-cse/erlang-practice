-module(q_r).
-export([ins/3]).

-record(shop, {item, quantity, cost}).


ins (Name, Qunatity, Cost) ->
	R = #shop{item=Name, quantity=Qunatity, cost=Cost},
	F = fun() ->
			mnesia:write(R)
		end,
	mnesia:transaction(F).
