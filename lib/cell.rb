require_relative 'helper'

class Cell

  def initialize
    @not_hit = true
  end

  def not_hit?
    @not_hit
  end

  def hit
    @not_hit = false if not_hit?
  end

end