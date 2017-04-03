require_relative 'battleship'

class Player

  attr_reader :name, :board

  def initialize(difficulty = 4)
    @difficulty = difficulty
    @name = get_name
    @board = assign_board
  end

  def get_name
    puts "Enter name: "
    @name = gets.chomp
  end

  def assign_board
    @board = Board.new(@difficulty)
  end

  def place_ships
    @board.place_ships
  end

end