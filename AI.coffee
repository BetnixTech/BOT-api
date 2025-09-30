class AI
  static response: (prompt) ->
    responses = ["Attack now!", "Defend!", "Collect the item!", "Hello adventurer!", "Level up!", "Retreat!", "Use a potion!", "Explore!", "Guard!", "Scout the area!"]
    responses[Math.floor(Math.random() * responses.length)]

module.exports = AI
