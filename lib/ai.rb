require_relative 'battleship'

class Ai

  attr_reader :name, :board

  def initialize(difficulty = 4)
    @difficulty = difficulty
    @name = 'Bob'
    assign_board
  end

  def assign_board
    @board = Board.new(@difficulty)
    @board.build
  end

  def place_ships
    @board.place_ships
  end

  def hit(board)
    loop do
      coordinate = board.grid.keys.sample
      if board.grid[coordinate].not_hit?
        board.hit(coordinate)
        break
      end
    end
  end

  def draw_board
    @board.draw
  end

  def draw_fog
    @board.draw_fog
  end

end