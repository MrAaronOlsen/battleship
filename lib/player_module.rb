module Player

  def assign_board(size = 4)
    @board = Board.new(size).build
  end

  def assign_ships
    @ships = (1..total_ships).collect do |id|
      Ship.new(id)
    end
  end

  def fleet_sunk?
    @ships.all? { |ship| ship.sunk? }
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