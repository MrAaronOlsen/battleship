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

  def test_that_it_pick_a_valid_placement
    ai = Ai.new
    ai.assign_board

    ai.board.grid['a1'].hit
    ai.board.grid['b4'].hit
    ai.board.grid['d3'].hit

    placement = ai.pick_placement

    assert_includes ai.board.index_key.keys, placement
  end

end