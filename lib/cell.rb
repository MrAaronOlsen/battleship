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
    if occupied? then false else @occupied = true end
  end

  def draw
    if occupied? && hit?
      '# '.red
    elsif hit?
      '* '.blue
    elsif occupied?
      '# '.yellow
    else
      'w '.blue
    end
  end

  def draw_fog
    if occupied? && hit?
      '# '.red
    elsif hit?
      '* '.blue
    else
      'w '.blue
    end
  end

end