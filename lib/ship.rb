require_relative 'helper'
require_relative 'ship_types'

class Ship
  include ShipTypes

  attr_reader :model

  def initialize(type)
    @model = build[type]
  end

end