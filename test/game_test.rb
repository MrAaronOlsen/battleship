require_relative 'test_helper'

class GameTest < Minitest::Test

  def test_that_it_is_a_game
    game = Game.new

    assert_instance_of Game, game
  end

end