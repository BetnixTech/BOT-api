import sequtils, random

proc aiResponse(prompt: string): string =
  let responses = @["Attack now!", "Defend!", "Collect the item!", "Hello adventurer!", "Level up!", "Scout!", "Guard!"]
  result = responses[rand(responses.len)]
