defmodule AI do
  def response(_prompt) do
    responses = ["Attack now!", "Defend!", "Collect item!", "Hello adventurer!", "Level up!"]
    Enum.random(responses)
  end
end
""",
    "elixir/main.exs": """alias Player
alias Commands
alias AI

alice = %Player{name: "Alice"}
bob = %Player{name: "Bob"}

IO.puts Commands.execute("attack", alice, [])
IO.puts Commands.execute("chat", bob, ["Hello!"])
