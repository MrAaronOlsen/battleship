require_relative 'battleship'

class Human
  include Player

  attr_reader :name, :board, :type
  attr_accessor :size

  def initialize(size)
    binding.pry
    @size = size
    @board = Board.new(@size).build
    @ships = assign_ships
    @type = 'Human'
  end

  def get_name
    @name = Prompt.get_name
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
    loop do
      print "Enter a coordinate to strike: "
      point = gets.chomp
      if board.valid_hit?(point)
        board.hit(point)
        break
      end
    end
  end

  def get_coords(ship)
    Prompt.get_ship_coords(ship)
  end

end