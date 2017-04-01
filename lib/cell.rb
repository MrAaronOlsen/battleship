require_relative 'helper'

class Cell

  def initialize
    @hit = false
  end

  def hit?
    @hit
  end

  def not_hit?
    @hit == false
  end

  def hit
    @hit = true if not_hit?
  end

  def draw
    if hit? then '*' else ' ' end
  end

end