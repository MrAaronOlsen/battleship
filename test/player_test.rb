require_relative 'test_helper'

class PlayerTest < Minitest::Test

  def test_that_it_is_a_player
    player = Player.new

    assert_instance_of Player, player
  end

  def test_that_it_can_have_a_name
    player = Player.new

    assert_equal player.name, 'Aaron'
  end

  def test_that_player_can_be_assigned_a_board
    player = Player.new
    player.assign_board

    assert_instance_of Board, player.board
  end

end
