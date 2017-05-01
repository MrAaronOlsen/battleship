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

  def occupied?
    @occupied
  end

  def not_occupied?
    @occupied == false
  end

  def hit
    @hit = true if not_hit?
  end

  def hit_ship?
    hit? && occupied?
  end

  def occupy
    @occupied = true unless @occupied
    self
  end

  def draw(fog)
    if occupied? && hit?
      '#'.red
    elsif hit?
      '*'.blue
    elsif occupied? && fog[:fog_off]
      '#'.yellow
    else
      'w'.blue
    end
  end

end