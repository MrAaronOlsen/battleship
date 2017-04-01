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

  def place(ship, placement)
  end

  def valid?(placement)
  end

  def horizontal?(placement)
    placement[0][0] == placement[1][0]
  end

  def vertical?(placement)
    placement[0][1..-1] == placement[1][1..-1]
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