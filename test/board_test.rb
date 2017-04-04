require_relative 'test_helper'
require_relative 'board_test_layouts'

class BoardTest < Minitest::Test

  def test_that_it_is_a_board
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that_size_defaults_to_five
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
    [[4, 2], [8, 3], [12, 5]].each do |diff|
      board = Board.new(diff[0])
      board.build
      assert_equal board.ships.length, diff[1]
    end
  end

  def test_that_difficulties_have_right_types_of_ships
    board = Board.new(4)
    board.build
    assert_equal board.ships[0].name, 'Destroyer'
    assert_equal board.ships[1].name, 'Submarine'

    board = Board.new(8)
    board.build
    assert_equal board.ships[0].name, 'Destroyer'
    assert_equal board.ships[1].name, 'Submarine'
    assert_equal board.ships[2].name, 'Cruiser'

    board = Board.new(12)
    board.build
    assert_equal board.ships[0].name, 'Destroyer'
    assert_equal board.ships[1].name, 'Submarine'
    assert_equal board.ships[2].name, 'Cruiser'
    assert_equal board.ships[3].name, 'Battleship'
    assert_equal board.ships[4].name, 'Carrier'
  end

  def test_that_it_has_cells
    board = Board.new
    board.build

    board.grid.values.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_that_cells_are_not_hit_when_created
    board = Board.new
    board.build

    assert board.grid.values.all? do |cell|
      cell.not_hit?
    end
  end

  def test_that_it_can_call_indexes_from_key
    board = Board.new
    board.build

    assert_equal board.index_key, BoardTestLayouts.index_key_beginner
  end

  def test_that_it_can_call_keys_from_indexes
    board = Board.new
    board.build

    assert_equal board.key_index, BoardTestLayouts.key_index_beginner
  end

  def test_that_it_can_collect_range_of_keys
    board = Board.new
    board.build

    assert_equal board.range_from( ['a1', 'a3'] ), ['a1', 'a2', 'a3']
    assert_equal board.range_from( ['a3', 'a1'] ), ['a1', 'a2', 'a3']
    assert_equal board.range_from( ['a1', 'c1'] ), ['a1', 'b1', 'c1']
    assert_equal board.range_from( ['c1', 'a1'] ), ['a1', 'b1', 'c1']
  end

  def test_that_board_cells_can_be_hit
    board = Board.new
    board.build
    board.grid['a1'].hit
    board.grid['d4'].hit

    assert board.grid['a1'].hit?
    assert board.grid['d4'].hit?
  end

  def test_that_it_can_collect_cells
    board = Board.new
    board.build

    cell0 = board.grid['b2']
    cell1 = board.grid['c2']
    cell2 = board.grid['d2']

    locations = board.range_from(['b2', 'd2'])
    cells = board.collect_cells(locations)

    assert_includes cells, cell0
    assert_includes cells, cell1
    assert_includes cells, cell2
  end

  def test_that_it_can_place_ships
    board = Board.new
    board.build

    cell1 = board.grid['a1']
    cell2 = board.grid['a2']
    cell3 = board.grid['a3']

    board.ships[0].occupy( [cell1, cell2, cell3] )

    assert board.grid['a1'].occupied?
    assert board.grid['a2'].occupied?
    assert board.grid['a3'].occupied?
  end


end