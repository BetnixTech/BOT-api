-module(player).
-export([start/1, loop/1]).

start(Name) ->
    spawn(?MODULE, loop, [{Name, 1, [], 0}]).

loop({Name, Level, Inventory, Exp}) ->
    receive
        {add_item, Item} ->
            loop({Name, Level, [Item|Inventory], Exp});
        {remove_item, Item} ->
            NewInv = lists:filter(fun(X) -> X =/= Item end, Inventory),
            loop({Name, Level, NewInv, Exp});
        {gain_exp, Points} ->
            NewExp = Exp + Points,
            NewLevel = Level,
            {NewLevel2, NewExp2} = if NewExp >= 100 -> {Level+1, NewExp-100}; true -> {NewLevel, NewExp}, 
            loop({Name, NewLevel2, Inventory, NewExp2});
        {get_info, Caller} ->
            Caller ! {info, Name, Level, Inventory, Exp},
            loop({Name, Level, Inventory, Exp});
        stop -> exit(normal)
    end.
