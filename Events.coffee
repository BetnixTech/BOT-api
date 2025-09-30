class Events
  constructor: ->
    @events = {}

  on: (name, fn) ->
    @events[name] ?= []
    @events[name].push(fn)

  trigger: (name, args) ->
    if @events[name]?
      for fn in @events[name]
        fn(args)

module.exports = Events
