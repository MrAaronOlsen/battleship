require_relative 'helper'

class Board

  attr_accessor :cells

  def initialize(size = 5)
    @size = 5
    @cells = {}
  end

  def build
    @size.times do |row|
      @cells[ (row+97).chr ] = (row+97).chr
      @size.times do |col|
        @cells[ (row+97).chr + (col+1).to_s ] = " "
      end
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

  def display
    print top.join(" ")

    @cells.each do |cell, value|
      print "\n" if edge(cell)
      print "#{value}".center(3)
    end
  end

end