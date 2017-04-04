require_relative 'battleship'

class Ai

  attr_reader :name, :board

  def initialize(difficulty = 4)
    @difficulty = difficulty
    @name = 'Computer'
    assign_board
    place_ships
  end

  def assign_board
    @board = Board.new(@difficulty)
    @board.build
  end

  def place_ships
    @board.place_ships(self)
  end

  def put(ship)
    loop do
      front = board.key_index.values.sample
      if board.grid[board.index_key[front]].not_occupied?
        all_solutions = solutions(front, ship)
        valid_solutions = valid(all_solutions).sample
        unless valid_solutions.empty? then return valid_solutions end
      end
    end
  end

  def valid(all_solutions)
    all_solutions.select do |solution|
        solution.none? { |key| @board.grid[key].occupied? }
    end
  end

  def solutions(front, ship)
    [right(front, ship), down(front, ship), left(front, ship), up(front, ship)].compact
  end

  def right(front, ship)
    back = front + (ship.size-1)
    if same_row?(front, back)
      (front..back).to_a.collect { |i| @board.index_key[i] }
    end
  end

  def down(front, ship)
    back = front + (@board.size * (ship.size-1))
      if back <= @board.total_cells
        range = (front..back).each_slice(@board.size).collect { |i| i }
        range = range.map { |i| i.first }
        range.to_a.collect { |i| @board.index_key[i] }
      end
  end

  def left(front, ship)
    back = front - (ship.size-1)
    if same_row?(front, back)
      (back..front).to_a.collect { |i| @board.index_key[i] }
    end
  end

  def up(front, ship)
    back = front - (@board.size * (ship.size-1))
      if back > 0
        range = (back..front).each_slice(@board.size).collect { |i| i }
        range = range.map { |i| i.first }
        range.to_a.collect { |i| @board.index_key[i] }
      end
  end

  def same_row?(index_1, index_2)
    (index_1/@board.size.to_f).ceil == (index_2/@board.size.to_f).ceil
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