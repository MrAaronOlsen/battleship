module Player

  def assign_board
    @board = Board.new(@difficulty)
    @board.build
  end

  def draw_board
    @board.draw
  end

  def draw_fog
    @board.draw_fog
  end

end