class Player
  property name : String
  property level : Int32
  property experience : Int32
  property inventory : Array(String)

  def initialize(@name)
    @level = 1
    @experience = 0
    @inventory = [] of String
  end

  def add_item(item : String)
    @inventory << item
  end

  def remove_item(item : String)
    @inventory.delete(item)
  end

  def gain_exp(points : Int32)
    @experience += points
    if @experience >= 100
      @level += 1
      @experience -= 100
    end
  end
end
