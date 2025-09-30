class Commands
  def initialize
    @commands = {} of String => Proc(Player, Array(String)) : String
  end

  def register(name : String, fn : Proc(Player, Array(String)) : String)
    @commands[name] = fn
  end

  def execute(name : String, player : Player, args : Array(String)) : String
    if @commands.has_key?(name)
      @commands[name].call(player, args)
    else
      "#{name} command not found"
    end
  end
end
