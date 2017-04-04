require_relative 'test_helper'

class GameTest < Minitest::Test

  def test_that_it_is_a_game
    game = Game.new

    assert_instance_of Game, game
  end

  def test_that_it_is_has_player_and_ai
    game = Game.new

    assert_instance_of Player, game.players[0]
    assert_instance_of Ai, game.players[1]
  end

  def test_that_it_can_switch_players
    game = Game.new

    assert_instance_of Player, game.players[0]
    assert_instance_of Ai, game.players[1]
  end

end