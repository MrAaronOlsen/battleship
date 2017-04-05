require_relative 'battleship'

class Ai
  include Player

  attr_reader :name, :board

  def initialize(difficulty = 4)
    @difficulty = difficulty
    assign_board
  end

  def get_name
    @name = 'Computer'
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
      valid?(solution)
    end
  end

  def valid?(solution)
    solution.none? { |key| @board.grid[key].occupied? }
  end

  def solutions(front, ship)
    [right(front, ship), down(front, ship), left(front, ship), up(front, ship)].compact
  end

  def left(front, ship)
    back = front - (ship.size-1)
    if same_row?(front, back)
      (back..front).to_a.collect { |i| @board.index_key[i] }
    end
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
        vertical_range(front, back)
      end
  end

  def up(front, ship)
    back = front - (@board.size * (ship.size-1))
      if back > 0
        vertical_range(back, front)
      end
  end

  def vertical_range(front, back)
    range = (front..back).each_slice(@board.size).collect do |slice|
              slice.first
            end

    range.to_a.collect { |i| @board.index_key[i] }
  end

  def same_row?(index_1, index_2)
    (index_1/@board.size.to_f).ceil == (index_2/@board.size.to_f).ceil
  end

  def hit(board) # Need exception if all cells are hit
    loop do
      coordinate = board.grid.keys.sample

      if board.grid[coordinate].not_hit?
        board.hit(coordinate)
        break
      end
    end
  end

end