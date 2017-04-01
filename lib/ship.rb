require_relative 'helper'
require_relative 'ship_types'

class Ship
  include ShipTypes

  attr_reader :type, :body

  def initialize(type)
    @type = type
    @body = []
  end

end