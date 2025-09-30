import player, commands, ai, tables, strutils

type
  BotDev = object
    players: Table[string, Player]

proc addPlayer(bot: var BotDev, name: string) =
  bot.players[name] = initPlayer(name)

proc execute(bot: var BotDev, cmd: string, playerName: string, args: seq[string]): string =
  if bot.players.hasKey(playerName):
    executeCommand(cmd, bot.players[playerName], args)
  else:
    "Player not found: " & playerName
