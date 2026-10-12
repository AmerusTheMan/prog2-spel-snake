require_relative "grid_squares"

class Grid

  def initialize(x, y)
    
    @array = Array.new(y) {Array.new(x) {GridSquare.new}}

  end

  def to_s
    
  end




end