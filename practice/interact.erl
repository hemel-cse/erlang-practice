-module(interact).
-export([start/1, current_time/0]).

start(Browser) -> running(Browser).


running(Browser) ->
	receive
		{Browser, #{entry => <<"input">>, txt => Bin}}
			Time = current_time(),
			Browser ! #{cmd => append_div, id => scroll,
						txt => list_to_binary([Time, "> ", Bin, "<br>"])}
	end,
	running(Browser).



current_time() ->
	{Hour, Min, Sec} = time(),
	list_to_binary(io_lib:fomrmat("~2.2.0w:~2.2.0w:~2.2.0w",
								[Hour, Min, Sec])).
