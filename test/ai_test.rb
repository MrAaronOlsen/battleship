require_relative 'test_helper'

class AiTest < Minitest::Test

  def test_it_is_an_ai
    ai = Ai.new

    assert_instance_of Ai, ai
  end

  def test_it_gets_a_name
    ai = Ai.new

    assert_equal ai.get_name, 'Computer'
  end

  def test_that_it_can_be_assigned_a_board
    ai = Ai.new
    ai.assign_board

    assert_instance_of Board, ai.board
  end

  def test_that_it_can_solve_right_placement
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(3)

    assert_equal ai.right(1, ship), ['a1', 'a2', 'a3']
    assert_nil ai.right(3, ship)
  end

  def test_that_it_can_solve_down_placement
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(3)

    assert_equal ai.down(1, ship), ['a1', 'b1', 'c1']
    assert_nil ai.down(9, ship)
  end

  def test_that_it_can_solve_left_placement
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(3)

    assert_equal ai.left(8, ship), ['b2', 'b3', 'b4']
    assert_nil ai.left(6, ship)
  end

  def test_that_it_can_solve_up_placement
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(3)

    assert_equal ai.up(14, ship), ['b2', 'c2', 'd2']
    assert_nil ai.up(3, ship)
  end

  def test_that_it_can_return_all_solutions
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(1)

    assert_equal ai.solutions(10, ship), [ ['c2', 'c3'], ['c2', 'd2'],
                                           ['c1', 'c2'], ['b2', 'c2'] ]
  end

  def test_that_it_can_detect_down_left_boundry_exceptions
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(1)

    assert_equal ai.solutions(13, ship), [ ['d1', 'd2'], ['c1', 'd1'] ]
  end

  def test_that_it_can_detect_right_up_boundry_exceptions
    ai = Ai.new
    ai.assign_board
    ship = Ship.new(1)

    assert_equal ai.solutions(4, ship), [ ['a4', 'b4'], ['a3', 'a4'], ]
  end

  def test_that_it_return_all_valid_placements

    ai = Ai.new
    ai.assign_board
    ship = Ship.new(1)
    ai.board.grid['c3'].occupy
    ai.board.grid['d2'].occupy

    all_solutions = ai.solutions(10, ship)
    assert_equal ai.valid(all_solutions), [ ['c1', 'c2'], ['b2', 'c2'] ]
  end

end