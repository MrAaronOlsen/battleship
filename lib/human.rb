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
      loop do
        pairs = Prompt.get_ship_coords(ship)
        pairs = @board.collect_indexes_by_key(pairs)
        arbiter = Arbiter.new([pairs], @board, ship)
        solutions = arbiter.solutions
        unless solutions.empty?
          solution = solutions.sample
          cells = @board.collect_cells_by_index(solution)
          ship.occupy(cells)
          break
        end
      end
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