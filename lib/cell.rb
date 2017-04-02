require_relative 'battleship'

class Cell

  def initialize
    @hit = false
    @occupied = false
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

  def occupied?
    @occupied
  end

  def occupy
    if occupied? then false else @occupied = true end
  end

  def draw
    if hit? then '*' else ' ' end
  end

end