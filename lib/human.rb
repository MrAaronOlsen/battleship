require_relative 'battleship'

class Human
  include Player

  attr_reader :name, :board

  def initialize(difficulty = 4)
    @difficulty = difficulty
    assign_board
  end

  def get_name
    Prompt.get_name
    @name = gets.chomp
  end

  def place_ships
    system 'clear'
    draw_board
    @board.place_ships(self)
  end

  def hit(board)
    print "Enter a coordinate to strike: "
    board.hit(gets.chomp)
  end

  def put(ship)
    Prompt.get_ship_coords(ship)
  end

end