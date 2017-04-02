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

  def test_that_player_has_no_board_when_created
    player = Player.new('Aaron')

    assert_nil player.board
  end

  def test_that_player_can_be_assigned_a_board
    player = Player.new('Aaron')
    board = Board.new
    player.assign(board)

    assert_equal player.board, board
  end

  def test_that_player_has_no_ships_when_created
    player = Player.new('Aaron')

    assert player.ships.empty?
  end

  def test_that_player_can_be_given_ships
    player = Player.new('Aaron')
    ship1 = Ship.new('cruiser')
    ship2 = Ship.new('battleship')
    ship3 = Ship.new('destroyer')
    player.give( [ship1, ship2, ship3] )

    assert_equal player.ships[0], ship1
    assert_equal player.ships[1], ship2
    assert_equal player.ships[2], ship3
  end

  def test_that_player_can_place_ships
    skip
  end

  def test_that_player_knows_when_a_ship_is_hit
    skip
  end

  def test_that_player_knows_when_a_ship_is_sunk
    skip
  end

  def test_that_player_knows_when_all_ships_are_sunk
    skip
  end

end