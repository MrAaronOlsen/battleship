require_relative 'test_helper'

class AiTest < Minitest::Test

  def test_it_is_an_ai
    ai = Ai.new

    assert_instance_of Ai, ai
  end

  def test_its_name_is_bob
    ai = Ai.new

    assert_equal ai.name, 'Bob'
  end

  def test_that_it_can_be_assigned_a_board
    ai = Ai.new
    ai.assign_board

    assert_instance_of Board, ai.board
  end

end