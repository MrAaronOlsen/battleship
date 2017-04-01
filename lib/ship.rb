require_relative 'helper'
require_relative 'ship_types'

class Ship
  include ShipTypes

  attr_reader :name, :body

  def initialize(type)
    @name = build[type].name
    @body = build[type].body
  end

  def sunk?
    @body.all? { |cell| cell.hit? }
  end

end