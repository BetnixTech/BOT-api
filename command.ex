defmodule Commands do
  def execute("attack", player, _args), do: "#{player.name} attacks!"
  def execute("chat", player, args), do: "#{player.name} says: #{Enum.join(args, " ")}"
  def execute(_, _, _), do: "Unknown command"
end
