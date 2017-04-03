require 'pry'

@size = 5
@grid = {}

def build
  @size.times do |row|
    @size.times do |col|
      @grid[ (row+97).chr + (col+1).to_s ] = (row+97).chr + (col+1).to_s
    end
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
  puts top.join(" ")

  @grid.each do |cell, value|
    print " #{cell[0]} " if cell[1].to_i == 1
    print "#{value}".center(3)
    puts "" if edge(cell)
  end
end

build
draw
puts ""