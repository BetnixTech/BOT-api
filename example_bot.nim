import botdev, tables

var bot = BotDev(players: initTable[string, Player]())

bot.addPlayer("Alice")
bot.addPlayer("Bob")

registerCommand("attack", proc(player: var Player, args: seq[string]): string =
  return player.name & " attacks!"
)

registerCommand("chat", proc(player: var Player, args: seq[string]): string =
  return player.name & " says: " & aiResponse(args.join(" "))
)

registerCommand("collect", proc(player: var Player, args: seq[string]): string =
  let items = @["Sword", "Potion", "Shield", "Gem"]
  let item = items[rand(items.len)]
  addItem(player, item)
  return player.name & " collected " & item
)

echo execute(bot, "attack", "Alice", @[])
echo execute(bot, "chat", "Bob", @["Hello!"])
echo execute(bot, "collect", "Alice", @[])
