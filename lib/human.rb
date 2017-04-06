require_relative 'battleship'

class Human
  include Player

  attr_reader :name, :board, :type
  attr_accessor :size

  def initialize(size = 4)
    @size = size
    @type = 'Human'
  end

  def get_name
    @name = Prompt.get_name
  end

  def place_ships
    @ships.each do |ship|
      loop do
        system 'clear'
        draw_board

        pairs = Prompt.get_ship_coords(ship, self)
        pairs = @board.collect_indexes_by_key(pairs)
        arbiter = Arbiter.new([pairs], @board, ship)
        solutions = arbiter.solutions

        unless solutions.empty?
          solution = solutions.sample
          cells = @board.collect_cells_by_index(solution)
          ship.occupy(cells)
          break
        end
        puts "\nInvalid Coordinate"
        sleep(2)
      end
    end
  end

  def hit(board)
    point = Prompt.get_hit_coord
    $MENU.call?(point)

    if board.valid_hit?(point)
      board.hit(point)
      return
    elsif point == 'Exit' || point == 'exit'
      $MENU.quit
    elsif point == 'Menu' || point == 'menu'
      $MENU.options
    end
    puts "\nInvalid Coordinate\n"
    sleep(2)
    hit(board)
  end

  def get_coords(ship)
    Prompt.get_ship_coords(ship)
  end

end