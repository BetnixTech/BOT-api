-module(botdev).
-export([add_player/2, ai_response/1]).

add_player(Name, State) ->
    Pid = player:start(Name),
    {ok, Pid, [{Name, Pid} | State]}.

ai_response(_Prompt) ->
    Responses = ["Attack now!", "Defend!", "Collect the item!", "Hello adventurer!", "Level up!", "Scout!", "Guard!"],
    Index = random:uniform(length(Responses)),
    lists:nth(Index, Responses).
