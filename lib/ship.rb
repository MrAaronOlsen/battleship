require_relative 'battleship'
require_relative 'ship_types'

class Ship
  include ShipTypes

  attr_reader :name, :body

  def initialize(type)
    @name = build[type].name
    @body = build[type].body
  end

  def occupy(cells)
    cells.each_with_index do |cell, i|
      @body[i] = cell.occupy
    end
  end

  def sunk?
    @body.all? { |cell| cell.hit? }
  end

  def size
    @body.length
  end

  def draw
    @body.reduce("") { |cell| cell + '#' }
  end

end