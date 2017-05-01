module Player

  def build(difficulty)
    @size = difficulty
    assign_board
    assign_ships
  end

  def assign_board
    @board = Board.new(@size).build
  end

  def assign_ships
    @ships = (1..total_ships).collect { |type| Ship.new(type) }
  end

  def total_ships
    (@size/2.5).round
  end

  def fleet_sunk?
    @ships.all? { |ship| ship.sunk? }
  end

  def draw(fog)
    @board.draw(fog)
  end

  def draw_ships_sunk
    @ships.each do |ship|
      if ship.sunk?
        print "#{ship.name}"[0..2].ljust(4).red
      else
        print "#{ship.name}"[0..2].ljust(4).yellow
      end
    end
    puts "\n\n"
  end

end