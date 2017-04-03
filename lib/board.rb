require_relative 'battleship'

class Board

  attr_reader :size
  attr_accessor :grid

  def initialize
    @size = $DIFFICULTY
    @grid = {}
    @ships = add_ships
  end

  def build
    @size.times do |row|
      @size.times do |col|
        @grid[ (row+97).chr + (col+1).to_s ] = (row+97).chr + (col+1).to_s
      end
    end
  end

  def add_ships
    (1..total_ships).collect { |ship| Ship.new(ship) }
  end

  def total_ships
    [($DIFFICULTY/2.0).round, 5].min
  end

  def place_ships
    cells = collect_cells(at(locations))
    ship.place(cells)
  end

  def collect_cells(locations)
    locations.map { |location| grid[location] }
  end

  def at(cells)
    rows = (cells[0][0]..cells[1][0]).to_a
    cols = (cells[0][1..-1]..cells[1][1..-1]).to_a
    zip(rows, cols)
  end

  def zip(rows, cols)
    (0..[rows.length, cols.length].max-1).collect do |i|
      if rows.length < 2 then x, y = 0, i else x, y = i, 0 end
      rows[x]+cols[y]
    end
  end

  def draw
    print top.join(" ")

    @grid.each do |cell, value|
      print "\n" if edge(cell)
      print "#{value}".center(3)
    end
  end

  def top
    (0..@size).collect do |i|
      if i.zero? then ' .' else i.to_s.rjust(2) end
    end
  end

  def edge(cell)
    (cell[1..-1].to_i).modulo(@size+1).zero?
  end

end