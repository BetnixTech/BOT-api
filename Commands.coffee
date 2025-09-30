class Commands
  constructor: ->
    @commands = {}

  register: (name, fn) ->
    @commands[name] = fn

  execute: (name, player, args) ->
    if @commands[name]?
      @commands[name](player, args)
    else
      "#{name} command not found"

module.exports = Commands
