require_relative 'battleship'

class Board

  attr_reader :size
  attr_accessor :cells

  def initialize(size = 4)
    @size = size
    @cells = {}
  end

  def build
    @size.times do |row|
      @cells[ (row+97).chr ] = (row+97).chr
      @size.times do |col|
        @cells[ (row+97).chr + (col+1).to_s ] = Cell.new
      end
    end
  end

  def place(ship, to)
    ship.place(on_cells(to[0], to[1]))
  end

  def on_cells(from, to)
    rows = (from[0]..to[0]).to_a
    cols = (from[1..-1]..to[1..-1]).to_a
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

    @cells.each do |cell, value|
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