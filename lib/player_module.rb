module Player

  def assign_board
    Board.new(@size).build
  end

  def assign_ships
    (1..total_ships).collect do |id|
      Ship.new(id)
    end
  end

  def total_ships
    (@size/2.5).round
  end

  def range_from(keys)
    keys = [@board.key_index[keys[0]], @board.key_index[keys[-1]]].sort
    range = (keys[0]..keys[1]).to_a

    unless same_row?(range)
      range = vertical_range(range)
    end

    range_from_indexes(range)
  end

  def range_from_indexes(range)
    unless same_row?(range)
      vertical_range(range)
    else
      range
    end
  end

  def vertical_range(range)
    range.each_slice(@size).collect do |slice|
      slice.first
    end
  end

  def same_row?(range)
    (range[0]/@size.to_f).ceil == (range[-1]/@size.to_f).ceil
  end

  def collect_cells(range)
    range.map { |index| @board.index_cell[index] }
  end

  def valid_key?(key)
    @board.grid.include?(key)
  end

  def valid_range?(range)
    range.none? { |cell| @board.grid[cell].occupied? }
  end

  def draw_board
    @board.draw
  end

  def draw_fog
    @board.draw_fog
  end

end