require_relative 'test_helper'

class CellTest < Minitest::Test

  def test_it_is_a_cell
    cell = Cell.new

    assert_instance_of Cell, cell
  end

  def test_it_is_not_hit_when_created
    cell = Cell.new

    assert cell.not_hit?
  end

  def test_it_can_be_hit
    cell = Cell.new
    cell.hit

    refute cell.not_hit?
  end

  def test_it_is_not_occupied_when_created
    cell = Cell.new

    refute cell.occupied?
  end

  def test_it_is_can_be_occupied
    cell = Cell.new
    cell.occupy

    assert cell.occupied?
  end

  def test_it_draws_empty
    cell = Cell.new

    assert_equal cell.draw, ' '
  end

  def test_it_draws_hit
    cell = Cell.new
    cell.hit

    assert_equal cell.draw, '*'
  end

end