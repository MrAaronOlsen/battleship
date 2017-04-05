require_relative 'test_helper'

class GameTest < Minitest::Test

  def test_that_it_is_a_game
    game = Game.new

    assert_instance_of Game, game
  end

  def test_that_it_is_has_human_and_ai
    game = Game.new

    assert_instance_of Human, game.player
    assert_instance_of Ai, game.opponent
  end

  def test_that_it_can_switch_players
    game = Game.new
    game.switch

    assert_instance_of Ai, game.player
    assert_instance_of Human, game.opponent
  end

end