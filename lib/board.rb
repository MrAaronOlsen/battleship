require_relative 'battleship'

class Board

  attr_reader :size, :grid, :ships

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

  def total_cells
    @grid.length
  end

  def hit(coords)
    @grid[coords].hit
  end

  def top
    (0..@size).collect do |i|
      if i.zero? then ' .' else i.to_s.rjust(2) end
    end
  end

  def edge(key)
    (key[1..-1].to_i).modulo(@size).zero?
  end

  def draw
    puts top.join

    @grid.each do |key, cell|
      print " #{key[0]} " if key[1].to_i == 1
      print cell.draw
      puts "" if edge(key)
    end

    puts ""
  end

  def draw_fog
    puts top.join

    @grid.each do |key, cell|
      print " #{key[0]} " if key[1].to_i == 1
      print cell.draw_fog
      puts "" if edge(key)
    end

    puts ""
  end

end