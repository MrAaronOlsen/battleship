require_relative 'battleship'

class Board

  attr_reader :size, :grid, :ships

  def initialize(size = 4)
    @size = size
    @grid = {}
    @ships = add_ships
  end

  def build
    @size.times do |row|
      @size.times do |col|
        @grid[ (row+97).chr + (col+1).to_s ] = Cell.new
      end
    end
  end

  def key_index
    Hash[(@grid.keys).zip(1..@grid.length).to_a]
  end

  def index_key
    Hash[(1..@grid.length).to_a.zip(@grid.keys)]
  end

  def add_ships
    (1..total_ships).collect { |id| Ship.new(id) }
  end

  def total_cells
    @grid.length
  end

  def total_ships
    (@size/2.5).round
  end

  def valid_key?(key)
    grid.include?(key)
  end

  def range_from(keys)
    front = [key_index[keys[0]], key_index[keys[-1]]].min
    back = [key_index[keys[0]], key_index[keys[-1]]].max
    range = (front..back).to_a

    unless keys[0][0] == keys[1][0]
      range = range.each_slice(@size).collect do |slice|
                slice.first
              end
    end
    range.collect { |i| index_key[i] }
  end


  def collect_cells(locations)
    locations.map { |location| @grid[location] }
  end

  def place_ships(player)
    @ships.each do |ship|
      keys = player.put(ship)
      cells = collect_cells(range_from(keys))
      ship.occupy(cells)
    end
  end

  def hit(coords)
    @grid[coords].hit
  end

  def top
    (0..@size).collect do |i|
      if i.zero? then ' .' else i.to_s.rjust(2) end
    end
  end

  def edge(cell)
    (cell[1..-1].to_i).modulo(@size).zero?
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