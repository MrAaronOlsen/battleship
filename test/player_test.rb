require_relative 'test_helper'

class PlayerTest < Minitest::Test

  def test_that_it_is_a_player
    player = Player.new

    assert_instance_of Player, player
  end

  def test_that_it_can_have_a_name
    player = Player.new
    player.name = 'Aaron'

    assert_equal player.name, 'Aaron'
  end

  def test_that_player_has_no_board_when_created
    player = Player.new

    assert_nil player.board
  end

  def test_that_player_can_be_assigned_a_board
    player = Player.new
    board = Board.new
    player.assign(board)

    assert_equal player.board, board
  end
  
end
