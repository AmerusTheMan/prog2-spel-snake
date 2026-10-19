require "gosu"
require_relative "grid_squares"


class Game < Gosu::Window
  def initialize(window_size=480, grid_size=20)
    super(window_size, window_size)
    self.caption = "SNAKE"

    @window_size = window_size
    @square_size = window_size/grid_size
    @grid_size = grid_size
    
    @line_color = Gosu::Color::WHITE
    @background_color = Gosu::Color::BLACK

    setup_grid()
  end

  def setup_grid
    @grid = Array.new(@grid_size) {Array.new(@grid_size) {EmptySquare.new}}
    @grid[0] = Array.new(@grid_size) {Obsticle.new}
    @grid[@grid_size-1] = Array.new(@grid_size) {Obsticle.new}

    @grid.each_with_index do |row, row_index|
      @grid[row_index][0] = Obsticle.new
      @grid[row_index][@grid_size-1] = Obsticle.new
    end
  end

  def draw_grid_squares
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        x_offset = column_index*@square_size
        y_offset = row_index*@square_size
        color = square.color ? square.color : @background_color
        Gosu.draw_rect(
          x_offset, y_offset,
          @square_size, @square_size,
          color
        )
      end
    end
  end

  def draw_grid_lines

    #draw horizontal
    @grid.each_with_index do |row, index|
      y = index*@square_size
    
      Gosu.draw_line(
        0, y, @line_color,
        @window_size, y, @line_color,
        z=10
      )
    end

    #draw vertical
    @grid[0].each_with_index do |square, index|
      x = index*@square_size

      Gosu.draw_line(
        x, 0, @line_color,
        x, @window_size, @line_color,
        z=10
      )
    end
  end

 

  def update()
    
  end

  def draw()
    draw_grid_lines()
    draw_grid_squares()
  end

  


end

game = Game.new
game.show