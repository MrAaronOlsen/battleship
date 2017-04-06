require_relative 'arbiter'

class Arbiter

  attr_accessor :pairs, :board, :ship

  def initialize(pairs, board, ship)
    @pairs = pairs
    @board = board
    @ship = ship
  end

  def solutions
    scrub_nils!
    sort_pairs!
    ranges_on_board = ranged_pairs(on_board)
    parsed_ranges = parse_ranges(ranges_on_board).compact
    matches_ship = scrub_wrong_length(parsed_ranges)
    scrub_occupied(matches_ship)
  end

  def scrub_nils!
    @pairs.reject! do |pair|
      pair.any? { |point| point.nil? }
    end
  end

  def sort_pairs!
    @pairs.map! { |pair| pair.sort }
  end

  def scrub_wrong_length(ranges)
    ranges.select do |range|
      matches_ship_length?(range)
    end
  end

  def scrub_occupied(ranges)
    ranges.select do |range|
      not_occupied?(range)
    end
  end

  def not_occupied?(range)
    range.none? { |cell| @board.index_cell[cell].occupied? }
  end

  def on_board
    @pairs.select do |pair|
      pair.none? do |cell|
        cell <= 0 || cell > @board.total_cells
      end
    end
  end

  def ranged_pairs(pairs)
    pairs.map { |pair| (pair[0]..pair[-1]).to_a }
  end

  def horizontal?(pair)
    (pair[0]/@board.size.to_f).ceil == (pair[-1]/@board.size.to_f).ceil
  end

  def vertical?(pair)
    (pair[0]/@board.size.to_f).ceil != (pair[-1]/@board.size.to_f).ceil
  end

  def parse_ranges(ranges)
    ranges.map do |range|
      if off_edge?(range)
        nil
      elsif vertical?(range)
        parse_vertical(range)
      else
        range
      end
    end
  end

  def parse_vertical(range)
    range.each_slice(@board.size).collect do |slice|
      slice.first
    end
  end

  def off_edge?(range)
    if matches_ship_length?(range) && vertical?(range)
      return true
    else
      return false
    end
  end

  def matches_ship_length?(range)
    range.length == @ship.size
  end

end