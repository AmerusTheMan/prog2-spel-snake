require "matrix"

class Snake
  attr_reader :direction_down, :direction_up, :direction_left, :direction_right

  def initialize(length=3)
    @direction_down = Vector[1, 0]
    @direction_up = Vector[-1, 0]
    @direction_left = Vector[0, -1]
    @direction_right = Vector[0, 1]

    @current_direction = @direction_right

    @remaining_body_appends = 0
    setup_body(length)
  end


  def setup_body(length)
    @body = []
    for i in 1..length do
      @body << @current_direction*-i
    end 
  end


  def feed(amount=1)
    @remaining_body_appends += 1
  end


  def remove_end(amount=1)
    @body.pop(amount)
  end

  def move
    @body.insert(current_direction*-1)
    if @remaining_body_appends == 0
      remove_end
    else
      @remaining_body_appends -= 1
    end

  end
end

snake = Snake.new