module Player

  def assign_board
    board = Board.new(@size).build
  end

  def assign_ships
    (1..total_ships).collect do |id|
      Ship.new(id)
    end
  end

  def total_ships
    (@size/2.5).round
  end

  def draw_board
    @board.draw
  end

  def draw_fog
    @board.draw_fog
  end

end