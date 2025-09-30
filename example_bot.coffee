BotDev = require './BotDev'

bot = new BotDev()

bot.events.on 'player_joined', (args) ->
  console.log "Player joined: #{args[0]}"

bot.addPlayer 'Alice'
bot.addPlayer 'Bob'

bot.commands.register 'attack', (player, args) ->
  "#{player.name} attacks!"

bot.commands.register 'chat', (player, args) ->
  msg = args.join(' ')
  "#{player.name} says: #{bot.aiResponse(msg)}"

bot.commands.register 'collect', (player, args) ->
  item = ['Sword', 'Potion', 'Shield', 'Gem'][Math.floor(Math.random() * 4)]
  player.addItem(item)
  "Collected #{item}"

console.log bot.executeCommand 'attack', 'Alice', []
console.log bot.executeCommand 'chat', 'Bob', ['Hello!']
console.log bot.executeCommand 'collect', 'Alice', []
