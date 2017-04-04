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
    draw_board
    @board.place_ships(self)
  end

  def put(ship)
    start_coord = board.grid.keys.sample
      if board.grid[start_coord].not_occupied?
        end_coord = start_coord[]
  end

  def direction(coord)
    [coord[1], coord[1..-1]].sample
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