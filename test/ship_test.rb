require_relative 'test_helper'

class ShipTest < Minitest::Test

  def setup

    @cell1 = Cell.new
    @cell2 = Cell.new
    @cell3 = Cell.new

  end

  def  test_that_it_is_a_ship
    ship = Ship.new('cruiser')

    assert_instance_of Ship, ship
  end

  def test_that_it_has_a_name
    ship = Ship.new('cruiser')

    assert_equal ship.name, 'Cruiser'
  end

  def test_that_it_has_a_size
    ship = Ship.new('cruiser')

    assert_equal ship.body.length, 3
  end

  def test_it_can_hold_cells
    ship = Ship.new('cruiser')
    ship.place([@cell1, @cell2, @cell3])

    ship.body.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_it_is_not_hit
    ship = Ship.new('cruiser')
    ship.place([@cell1, @cell2, @cell3])

    assert ship.body[0].not_hit?
  end

  def test_it_can_be_hit
    ship = Ship.new('cruiser')
    ship.place([@cell1, @cell2, @cell3])
    @cell1.hit

    assert ship.body[0].hit?
  end

  def test_it_knows_it_is_not_sunk
    ship = Ship.new('cruiser')
    ship.place([@cell1, @cell2, @cell3])

    refute ship.sunk?
  end

  def test_it_knows_it_is_sunk
    ship = Ship.new('cruiser')
    ship.place([@cell1, @cell2, @cell3])

    ship.body.each { |cell| cell.hit }

    assert ship.sunk?
  end

  def test_it_occupied_cells
    ship = Ship.new('cruiser')
    ship.place([@cell1, @cell2, @cell3])

    ship.body.each do |cell|
      assert cell.occupied?
    end
  end

end