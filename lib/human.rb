require_relative 'battleship'

class Human
  include Player

  attr_reader :name, :board

  def initialize(size = 4)
    @size = size
    @board = assign_board
    @ships = assign_ships
  end

  def get_name
    Prompt.get_name
    @name = gets.chomp
  end

  def place_ships
    system 'clear'
    draw_board
    @board.place_ships(self)
  end

  def place_ships
    @ships.each do |ship|
      draw_board
      keys = get_coords(ship)

      cells = collect_cells(range_from(keys))
      ship.occupy(cells)
    end
  end

  def hit(board)
    print "Enter a coordinate to strike: "
    board.hit(gets.chomp)
  end

  def get_coords(ship)
    Prompt.get_ship_coords(ship)
  end

end