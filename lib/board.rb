require_relative 'battleship'

class Board

  attr_reader :size, :grid

  def initialize(size = 4)
    @size = size
    @grid = {}
  end

  def build
    @size.times do |row|
      @size.times do |col|
        @grid[ (row+97).chr + (col+1).to_s ] = Cell.new
      end
    end
    self
  end

  def key_index
    Hash[(@grid.keys).zip(1..@grid.length).to_a]
  end

  def index_key
    Hash[(1..@grid.length).to_a.zip(@grid.keys)]
  end

  def index_cell
    Hash[(1..@grid.length).to_a.zip(@grid.values)]
  end

  def includes?(key)
    @grid.keys.include?(key)
  end

  def valid_hit?(key)
    includes?(key) && grid[key].not_hit?
  end

  def collect_cells(key_range)
    key_range.map { |key| grid[key] }
  end

  def collect_cells_by_index(index_range)
    index_range.map { |index| index_cell[index] }
  end

  def collect_indexes_by_key(key_range)
    key_range.map { |key| key_index[key] }
  end

  def total_cells
    @grid.length
  end

  def hit(coords)
    @grid[coords].hit
    @grid[coords].hit_ship?
  end

  def hit_ship?(coords)
    @grid[coords].hit_ship?
  end

  def top
    (0..@size).collect do |i|
      if i.zero? then ' .' else "#{i.to_s}".rjust(2) end
    end
  end

  def r_edge?(key)
    (key[1..-1].to_i).modulo(@size).zero?
  end

  def l_edge?(key)
    (key_index[key]-1).modulo(@size).zero?
  end

  def draw(fog)
    puts top.join
    @grid.each do |key, cell|
      print " #{key[0]} " if l_edge?(key)
      print "#{cell.draw(fog)} "
      puts "" if r_edge?(key)
    end
  end
end