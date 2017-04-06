require_relative 'battleship'

class Ai
  include Player

  attr_reader :name, :board, :type
  attr_accessor :size

  def initialize(size)
    binding.pry
    @size = size
    @board = Board.new(@size).build
    @ships = assign_ships
    @type ='Computer'
  end

  def get_name
    @name = 'Computer'
  end

  def place_ships
    @ships.each do |ship|
      loop do
        pairs = get_ranges(ship)
        arbiter = Arbiter.new(pairs, @board, ship)
        solutions = arbiter.solutions
        unless solutions.empty?
          solution = solutions.sample
          cells = @board.collect_cells_by_index(solution)
          ship.occupy(cells)
          break
        end
      end
    end
  end

  def hit(board)
    loop do
      point = board.grid.keys.sample
      if board.valid_hit?(point)
        board.hit(point)
        break
      end
    end
  end

  def pick_placement
    loop do
      coord = @board.key_index.values.sample
      return coord if @board.index_cell[coord].not_occupied?
    end
  end

  def get_ranges(ship)
    front = pick_placement
    [ [front, right(front, ship)].sort,
      [front, down(front, ship)].sort,
      [front, left(front, ship)].sort,
      [front, up(front, ship)].sort ]
  end

  def left(front, ship)
    left = front - (ship.size-1)
  end

  def right(front, ship)
    front + (ship.size-1)
  end

  def down(front, ship)
    front + (@size * (ship.size-1))
  end

  def up(front, ship)
    front - (@size * (ship.size-1))
  end

end