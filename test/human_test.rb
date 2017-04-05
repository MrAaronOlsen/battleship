require_relative 'test_helper'

class HumanTest < Minitest::Test

  def test_that_it_is_a_player
    player = Human.new

    assert_instance_of Human, player
  end

  # def test_that_it_can_have_a_name
  #   player = Human.new
  #
  #   assert_equal player.get_name, 'Aaron'
  # end

  def test_that_it_can_be_assigned_a_board
    player = Human.new
    player.assign_board

    assert_instance_of Board, player.board
  end

end
