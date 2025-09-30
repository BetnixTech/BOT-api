Player = require './Player'
Commands = require './Commands'
Events = require './Events'
AI = require './AI'

class BotDev
  constructor: ->
    @players = {}
    @commands = new Commands()
    @events = new Events()

  addPlayer: (name) ->
    @players[name] = new Player(name)
    @events.trigger('player_joined', [name])

  executeCommand: (cmd, player, args) ->
    @commands.execute(cmd, @players[player], args)

  aiResponse: (prompt) ->
    AI.response(prompt)

module.exports = BotDev
