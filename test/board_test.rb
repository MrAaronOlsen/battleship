require_relative 'test_helper'
require_relative 'board_test_layouts'

class BoardTest < Minitest::Test

  def test_that_it_is_a_board
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that_it_has_a_size
    board = Board.new

    assert_equal board.size, 4
  end

  def test_that_it_can_have_a_different_size
    board = Board.new(6)

    assert_equal board.size, 6
  end

  def test_that_board_hass_no_cells_when_created
    board = Board.new

    assert board.grid.empty?
  end

  def test_that_it_builds_default_min_board_size_references
    board = Board.new
    board.build

    assert_equal board.grid.keys, BoardTestLayouts.min
  end

  def test_that_it_builds_max_board_size_references
    board = Board.new(12)
    board.build

    assert_equal board.grid.keys, BoardTestLayouts.max
  end

  def test_that_builds_default_min_top
    board = Board.new
    board.build

    assert_equal board.top, BoardTestLayouts.top_min
  end

  def test_that_builds_max_top
    board = Board.new(12)
    board.build

    assert_equal board.top, BoardTestLayouts.top_max
  end

  def test_that_it_has_cells
    board = Board.new
    board.build

    assert_instance_of Cell, board.grid['a1']
    assert_instance_of Cell, board.grid['d4']
  end

  def test_that_cells_are_not_hit_when_created
    board = Board.new
    board.build

    assert board.grid['a1'].not_hit?
    assert board.grid['d4'].not_hit?
  end

  def test_that_cells_can_be_hit
    board = Board.new
    board.build
    board.grid['a1'].hit
    board.grid['d4'].hit

    refute board.grid['a1'].not_hit?
    refute board.grid['d4'].not_hit?
  end

  def test_that_it_can_parse_horizontal_placement
    board = Board.new
    locations = ['b9', 'b12']

    assert_equal board.at(locations), ['b9', 'b10', 'b11', 'b12']
  end

  def test_that_it_can_parse_vertical_placement
    board = Board.new
    locations = ['b2', 'd2']

    assert_equal board.at(locations), ['b2', 'c2', 'd2']
  end

  def test_that_it_can_collect_cells
    board = Board.new
    board.build
    
    cell0 = board.grid['b2']
    cell1 = board.grid['c2']
    cell2 = board.grid['d2']

    locations = board.at(['b2', 'd2'])
    cells = board.collect_cells(locations)

    assert_includes cells, cell0
    assert_includes cells, cell1
    assert_includes cells, cell2
  end

end