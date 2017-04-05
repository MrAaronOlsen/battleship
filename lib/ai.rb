require_relative 'battleship'

class Ai
  include Player

  attr_reader :name, :board

  def initialize(size = 4)
    @size = size
    @board = assign_board
    @ships = assign_ships
  end

  def get_name
    @name = 'Computer'
  end

  def place_ships
    @ships.each do |ship|
      coords = get_coords(ship)
      ranges = get_ranges(coords)
      on_board = on_board?(ranges)
      parsed = parse_ranges(on_board)
      valids = valid_ranges(parsed)
      range = valids.sample
      cells = collect_cells(range)
      ship.occupy(cells)
      binding.pry
    end
  end

  def on_board?(ranges)
    ranges.select do |range|
      range.none? { |index| index <= 0 || index > @board.total_cells }
    end
  end

  def valid_ranges(ranges)
    ranges.select do |range|
      same_row?(range)
    end
  end

  def get_coords(ship)
    coord_ranges(valid_coord, ship)
  end

  def coord_ranges(front, ship)
    [ [front, right(front, ship)].sort,
      [front, down(front, ship)].sort,
      [front, left(front, ship)].sort,
      [front, up(front, ship)].sort ]
  end

  def valid_coord
    loop do
      coord = @board.key_index.values.sample
      return coord if @board.index_cell[coord].not_occupied?
    end
  end

  def get_ranges(ranges)
    ranges = ranges.map { |range| (range[0]..range[1]).to_a }
  end

  def parse_ranges(ranges)
    ranges.map do |coord|
      range_from_indexes(coord)
    end
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

  def hit(board)
    loop do
      coordinate = board.grid.keys.sample

      if board.grid[coordinate].not_hit?
        board.hit(coordinate)
        break
      end
    end
  end

end