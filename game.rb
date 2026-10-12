require "gosu"
require_relative "grid"

class Game < Gosu::Window
  def initialize()
    super(480, 480)
    self.caption = "SNAKE"


    @grid = Grid.new(5, 5)
  end

  def draw_grid
    Gosu.draw_rect()
  end


end

game = Game.new
game.draw_grid