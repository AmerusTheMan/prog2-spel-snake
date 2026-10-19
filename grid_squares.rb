require "gosu"

class GridSquare
  attr_reader :color

  def initialize(color=nil)
    @color = color
  end
end



class Obsticle < GridSquare
  def initialize()
    super(color=Gosu::Color::GREEN)
  end
end



class Consumable < GridSquare
  def initialize()
    super(color=Gosu::Color::RED)
  end
end



class SnakePart < GridSquare
  def initialize
    super(color=Gosu::Color::WHITE)
  end
end



class EmptySquare < GridSquare
  
end