type
  Player = object
    name: string
    level: int
    experience: int
    inventory: seq[string]

proc initPlayer(name: string): Player =
  result.name = name
  result.level = 1
  result.experience = 0
  result.inventory = @[]

proc addItem(p: var Player, item: string) =
  p.inventory.add(item)

proc removeItem(p: var Player, item: string) =
  p.inventory = p.inventory.filterIt(it != item)

proc gainExp(p: var Player, points: int) =
  p.experience += points
  if p.experience >= 100:
    p.level += 1
    p.experience -= 100
