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

end