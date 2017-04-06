require_relative 'test_helper'

class ArbiterTest < Minitest::Test

  def setup
    @board = Board.new.build
    @ship = Ship.new(2)
    @pairs = [ [12, 14], [12, 20], [10, 12], [4, 12] ]
  end

  def test_that_it_is_an_arbiter
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert_instance_of Arbiter, arbiter
  end

  def test_that_it_has_pairs_board_and_ship
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert_equal arbiter.pairs, @pairs
    assert_equal arbiter.board, @board
    assert_equal arbiter.ship, @ship
  end

  def test_that_it_removes_pairs_not_on_board
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert_equal arbiter.on_board, [ [12, 14], [10, 12], [4, 12] ]
  end

  def test_that_it_fills_pairs
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert_equal arbiter.ranged_pairs(@pairs), [ [12, 13, 14], [12, 13, 14, 15, 16, 17, 18, 19, 20],
                                               [10, 11, 12], [4, 5, 6, 7, 8, 9, 10, 11, 12] ]
  end

  def test_that_it_knows_horizontal_pairs
    arbiter = Arbiter.new(@pairs, @board, @ship)

    refute arbiter.horizontal?([12, 13, 14])
    refute arbiter.horizontal?([12, 13, 14, 15, 16, 17, 18, 19, 20])
    assert arbiter.horizontal?([10, 11, 12])
    refute arbiter.horizontal?([4, 5, 6, 7, 8, 9, 10, 11, 12])
  end

  def test_that_it_can_parse_vertical_range
    arbiter = Arbiter.new(@pairs, @board, @ship)
    range1 = [12, 13, 14, 15, 16, 17, 18, 19, 20]
    range2 = [4, 5, 6, 7, 8, 9, 10, 11, 12]

    assert_equal arbiter.parse_vertical(range1), [12, 16, 20]
    assert_equal arbiter.parse_vertical(range2), [4, 8, 12]
  end

  def test_that_it_knows_vertical_pairs
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert arbiter.vertical?([12, 13, 14])
    assert arbiter.vertical?([12, 14])
    assert arbiter.vertical?([12, 13, 14, 15, 16, 17, 18, 19, 20])
    assert arbiter.vertical?([12, 20])
    refute arbiter.vertical?([10, 11, 12])
    assert arbiter.vertical?([4, 5, 6, 7, 8, 9, 10, 11, 12])
  end

  def test_that_it_can_parse_any_ranges
    arbiter = Arbiter.new(@pairs, @board, @ship)
    ranges = [ [1, 2, 3], [12, 13, 14, 15, 16, 17, 18, 19, 20],
               [-1, 0, 1], [4, 5, 6, 7, 8, 9, 10, 11, 12] ]

    assert_equal arbiter.parse_ranges(ranges), [ [1, 2, 3], [12, 16, 20],
                                                 nil, [4, 8, 12] ]
  end

  def test_that_it_can_match_range_length_to_ship_length
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert arbiter.matches_ship_length?([1, 2, 3])
    refute arbiter.matches_ship_length?([1])

    arbiter = Arbiter.new(@pairs, @board, Ship.new(5))
    assert arbiter.matches_ship_length?([1, 2, 3, 4, 5])
    refute arbiter.matches_ship_length?([1])
  end

  def test_that_it_knows_when_range_goes_over_edge
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert arbiter.off_edge?([12, 13, 14])
    refute arbiter.off_edge?([1, 2, 3])
    assert arbiter.off_edge?([8, 9, 10])
    assert arbiter.off_edge?([0, 1, 2])
  end

  def test_that_it_can_find_solutions
    arbiter = Arbiter.new(@pairs, @board, @ship)

    assert_equal arbiter.solutions, ( [[10, 11, 12], [4, 8, 12]] )
  end

  def test_that_it_can_find_no_solutions
    pairs = [ [1, 2], [0, 1, 2], [7, 11], [12, 20] ]
    arbiter = Arbiter.new(pairs, @board, @ship)

    assert_equal arbiter.solutions, []
  end

  def test_that_it_can_find_solutions_with_one_pair
    pairs = [ [7, 15] ]
    arbiter = Arbiter.new(pairs, @board, @ship)

    assert_equal arbiter.solutions, [ [7, 11, 15] ]
  end

end