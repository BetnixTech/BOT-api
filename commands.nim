type
  Command = proc(player: var Player, args: seq[string]): string

var commands = initTable[string, Command]()

proc registerCommand(name: string, cmd: Command) =
  commands[name] = cmd

proc executeCommand(name: string, player: var Player, args: seq[string]): string =
  if commands.hasKey(name):
    commands[name](player, args)
  else:
    "Unknown command: " & name
