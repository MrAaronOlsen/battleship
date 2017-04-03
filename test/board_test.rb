require_relative 'test_helper'
require_relative 'board_test_layouts'

class BoardTest < Minitest::Test

  def test_that_it_is_a_board
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that_it_has_correct_sizes_for_difficulty
    assert_equal Board.new(4).size, 4
    assert_equal Board.new(8).size, 8
    assert_equal Board.new(12).size, 12
  end

  def test_that_board_has_no_cells_when_created
    board = Board.new

    assert board.grid.empty?
  end

  def test_that_it_builds_beginner_board
    board = Board.new(4)
    board.build

    assert_equal board.top, BoardTestLayouts.top_beginner
    assert_equal board.grid.keys, BoardTestLayouts.beginner
  end

  def test_that_it_builds_intermediate_board
    board = Board.new(8)
    board.build

    assert_equal board.top, BoardTestLayouts.top_intermediate
    assert_equal board.grid.keys, BoardTestLayouts.intermediate
  end

  def test_that_it_builds_expert_board
    board = Board.new(12)
    board.build

    assert_equal board.top, BoardTestLayouts.top_expert
    assert_equal board.grid.keys, BoardTestLayouts.expert
  end

  def test_that_difficulties_have_right_number_of_ships
    skip
    [[5, 3], [8, 4], [12, 5]].each do |diff|
      assert_equal Board.new(diff[0]).build, diff[1]
    end
  end

  def test_that_it_has_cells
    skip
    board = Board.new.build

    board.grid.keys.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_that_cells_are_not_hit_when_created
    skip
    board = Board.new.build

    assert board.grid.keys.none? do |cell|
      cell.hit? == true
    end

  end

  def test_that_board_cells_can_be_hit
    skip
    board = Board.new
    board.build
    board.grid['a1'].hit
    board.grid['d4'].hit

    assert board.grid['a1'].hit?
    assert board.grid['d4'].hit?
  end

  def test_that_it_can_parse_horizontal_placement
    skip
    board = Board.new
    locations = ['b9', 'b12']

    assert_equal board.at(locations), ['b9', 'b10', 'b11', 'b12']
  end

  def test_that_it_can_parse_vertical_placement
    skip
    board = Board.new
    locations = ['b2', 'd2']

    assert_equal board.at(locations), ['b2', 'c2', 'd2']
  end

  def test_that_it_can_collect_cells
    skip
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