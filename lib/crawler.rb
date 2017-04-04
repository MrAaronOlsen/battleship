require_relative 'battleship'

class Crawler

  attr_reader :grid, :map

  def initialize(board)
    @grid = board.grid
    @map = make_map
  end

  def make_map
    Hash[(1..@grid.length).to_a.zip(@grid.keys)]
  end

  def collect_range(keys)
    rows = (keys[0][0]..keys[1][0]).to_a
    cols = (keys[0][1..-1]..keys[1][1..-1]).to_a
    zip(rows, cols)
  end

  def zip(rows, cols)
    (0..[rows.length, cols.length].max-1).collect do |i|
      if rows.length < 2 then x, y = 0, i else x, y = i, 0 end
      rows[x]+cols[y]
    end
  end

end