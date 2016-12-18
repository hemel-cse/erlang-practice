%%%-------------------------------------------------------------------
%%% @author s4kib
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Dec 2016 1:34 AM
%%%-------------------------------------------------------------------
-module(concurrent_bot).
-author("s4kib").
-compile([debug_info]).

%% API
-export([bot_x/0, bot_y/2, start/0]).

bot_x() ->
  receive
    {Pid, Message, Counter} ->
      io:format("Received ~w #~w: ~s~n", [Pid, Counter, Message]),
      if
        Counter < 10 ->
          Pid ! {self(), "X", Counter + 1},
          bot_x()
      end
  end.

bot_y(InitPid, Begin) ->
  if
    Begin == 1 ->
      InitPid ! {self(), "Y", 0}
  end,

  receive
    {Pid, Message, Counter} ->
      io:format("Received ~w #~w: ~s~n", [Pid, Counter, Message]),
      if
        Counter < 10 ->
          Pid ! {self(), "Y", Counter + 1},
          bot_y(Pid,0)
      end
  end.

start() ->
  Pid = spawn(concurrent_bot, bot_x, []),
  spawn(concurrent_bot, bot_y, [Pid,1]).
