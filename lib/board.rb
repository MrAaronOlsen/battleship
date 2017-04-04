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

  def add_ships
    (1..total_ships).collect { |id| Ship.new(id) }
  end

  def total_ships
    (@size/2.5).round
  end

  def place_ships(player)
    @ships.each do |ship|
      system 'clear'
      draw
      cells = collect_cells(from(player.put(ship)))
      ship.occupy(cells)
    end
  end

  def hit(coords)
    @grid[coords].hit
  end

  def collect_cells(locations)
    locations.map { |location| grid[location] }
  end

  def from(keys)
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