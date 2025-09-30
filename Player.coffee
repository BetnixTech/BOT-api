class Player
  constructor: (@name) ->
    @level = 1
    @inventory = []
    @experience = 0

  addItem: (item) ->
    @inventory.push(item)

  removeItem: (item) ->
    @inventory = @inventory.filter (i) -> i isnt item

  gainExp: (points) ->
    @experience += points
    if @experience >= 100
      @level += 1
      @experience = @experience - 100

module.exports = Player
