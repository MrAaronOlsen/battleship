require_relative 'battleship'

class Player

  attr_reader :name, :board

  def initialize(difficulty = 4)
    @difficulty = difficulty
    @name = ""
    assign_board
    place_ships
  end

  def get_name
    get_name
    @name = gets.chomp
  end

  def assign_board
    @board = Board.new(@difficulty)
    @board.build
  end

  def place_ships
    draw_board
    @board.place_ships
  end

  def draw_board
    @board.draw
  end

  def draw_fog
    @board.draw_fog
  end

  def hit(board)
    print "Enter a coordinate to strike: "
    board.hit(gets.chomp)
  end

end