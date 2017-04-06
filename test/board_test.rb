require_relative 'test_helper'
require_relative 'board_test_layouts'

class BoardTest < Minitest::Test

  def test_that_it_is_a_board
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that_size_defaults_to_four
    assert_equal Board.new.size, 4
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
    board = Board.new(4).build

    assert_equal board.top, BoardTestLayouts.top_beginner
    assert_equal board.grid.keys, BoardTestLayouts.beginner
  end

  def test_that_it_builds_intermediate_board
    board = Board.new(8).build

    assert_equal board.top, BoardTestLayouts.top_intermediate
    assert_equal board.grid.keys, BoardTestLayouts.intermediate
  end

  def test_that_it_builds_expert_board
    board = Board.new(12).build

    assert_equal board.top, BoardTestLayouts.top_expert
    assert_equal board.grid.keys, BoardTestLayouts.expert
  end

  def test_that_it_can_count_total_cells
    board = Board.new(4).build

    assert_equal board.total_cells, 16
  end

  def test_that_it_has_cells
    board = Board.new.build

    board.grid.values.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_that_cells_are_not_hit_when_created
    board = Board.new.build

    assert board.grid.values.all? do |cell|
      cell.not_hit?
    end
  end

  def test_that_it_can_call_indexes_from_key
    board = Board.new.build

    assert_equal board.index_key, BoardTestLayouts.index_key_beginner
  end

  def test_that_it_can_call_keys_from_indexes
    board = Board.new.build

    assert_equal board.key_index, BoardTestLayouts.key_index_beginner
  end

  def test_that_it_can_call_cell_by_indexes
    board = Board.new.build

    cell1 = board.grid['a1']
    cell2 = board.grid['d3']
    cell3 = board.grid['c1']

    assert_equal board.index_cell[1], cell1
    assert_equal board.index_cell[15], cell2
    assert_equal board.index_cell[9], cell3
  end

  def test_that_board_cells_can_be_hit
    board = Board.new.build
    board.grid['a1'].hit
    board.grid['d4'].hit

    assert board.grid['a1'].hit?
    assert board.grid['d4'].hit?
  end

  def test_that_it_can_collect_cells
    board = Board.new.build

    cell0 = board.grid['b2']
    cell1 = board.grid['c2']
    cell2 = board.grid['d2']

    cells = board.collect_cells(['b2', 'c2', 'd2'])

    assert_equal cells[0], cell0
    assert_equal cells[1], cell1
    assert_equal cells[2], cell2
  end

end