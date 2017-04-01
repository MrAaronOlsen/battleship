require_relative 'test_helper'
require_relative 'board_test_layouts'

class BoardTest < Minitest::Test

  def setup

  end

  def test_that_it_is_a_board
    board = Board.new
    assert_instance_of Board, board
  end

  def test_that_it_has_a_size
    board = Board.new
    assert_equal board.size, 5
  end

  def test_that_it_can_have_a_different_size
    board = Board.new(6)
    assert_equal board.size, 6
  end

  def test_that_it_can_not_be_bigger_than_12
    board = Board.new(26)
    assert_equal board.size, 12
  end

  def test_that_it_can_not_be_smaller_than_5
    board = Board.new(4)
    assert_equal board.size, 5
  end

  def test_that_board_hass_no_cells_when_created
    board = Board.new
    assert board.cells.empty?
  end

  def test_that_it_builds_default_min_board_size
    board = Board.new
    assert_equal board.cells, BoardTestLayouts::min
  end

  def test_that_it_builds_max_board_size
    board = Board.new(12)
    assert_equal board.cells, BoardTestLayouts::max
  end



end


end