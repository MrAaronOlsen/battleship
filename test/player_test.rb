require_relative 'test_helper'

class PlayerTest < Minitest::Test

  def test_that_it_is_a_player
    player = Player.new('Aaron')

    assert_instance_of Player, player
  end

  def test_that_it_has_a_name
    player = Player.new('Aaron')

    assert_equal player.name, 'Aaron'
  end

end