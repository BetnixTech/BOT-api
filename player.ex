defmodule Player do
  defstruct name: "", level: 1, experience: 0, inventory: []

  def add_item(player, item) do
    %{player | inventory: [item | player.inventory]}
  end

  def remove_item(player, item) do
    %{player | inventory: Enum.filter(player.inventory, fn x -> x != item end)}
  end

  def gain_exp(player, points) do
    new_exp = player.experience + points
    new_level = if new_exp >= 100, do: player.level + 1, else: player.level
    final_exp = if new_exp >= 100, do: new_exp - 100, else: new_exp
    %{player | experience: final_exp, level: new_level}
  end
end
