class AI
  RESPONSES = ["Attack now!", "Defend!", "Collect item!", "Hello adventurer!", "Level up!"]

  def self.response(prompt : String)
    RESPONSES[rand(RESPONSES.size)]
  end
end
""",
    "crystal/main.cr": """require "./player"
require "./commands"
require "./ai"

alice = Player.new("Alice")
bob = Player.new("Bob")

cmds = Commands.new
cmds.register "attack", ->(p, args){ "#{p.name} attacks!" }
cmds.register "chat", ->(p, args){ "#{p.name} says: #{AI.response(args.join(" "))}" }

puts cmds.execute("attack", alice, [])
puts cmds.execute("chat", bob, ["Hello!"])
