require_relative 'test_helper'

class GameTest < Minitest::Test

  def setup
    @player = Player.new('Aaron')
    @ai = Ai.new('Billy')
  end

  def test_that_it_is_a_game
    game = Game.new(@player, @ai)

    assert_instance_of Game, game
  end

  def test_that_it_is_can_have_player_and_ai
    game = Game.new(@player, @ai)

    assert_equal game.players[1], @player
    assert_equal game.players[-1], @ai
  end

  def test_that_it_can_switch_turns
    game = Game.new(@player, @ai)
    assert_equal game.turn, 1
    game.switch
    assert_equal game.turn, -1
  end

  def test_that_it_can_switch_players
    game = Game.new(@player, @ai)
    assert_equal game.current_player, @player
    game.switch
    assert_equal game.current_player, @ai
  end

end