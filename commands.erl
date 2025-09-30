-module(commands).
-export([execute/3]).

execute(attack, PlayerPid, _) ->
    PlayerPid ! {attack, self()},
    "Attack command sent";
execute(chat, PlayerPid, Msg) ->
    PlayerPid ! {chat, Msg},
    "Chat command sent";
execute(collect, PlayerPid, Item) ->
    PlayerPid ! {add_item, Item},
    "Collect command sent";
execute(_, _, _) ->
    "Unknown command".
