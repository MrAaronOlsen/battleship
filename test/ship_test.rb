require_relative 'test_helper'

class ShipTest < Minitest::Test

  def setup
    @cell1 = Cell.new
    @cell2 = Cell.new
    @cell3 = Cell.new
  end

  def  test_that_it_is_a_ship
    ship = Ship.new(3)

    assert_instance_of Ship, ship
  end

  def test_all_ships_have_name_and_correct_size
    ship = Ship.new(5)
    assert_equal ship.name, 'Carrier'
    assert_equal ship.body.length, 5

    ship = Ship.new(4)
    assert_equal ship.name, 'Battleship'
    assert_equal ship.body.length, 4

    ship = Ship.new(3)
    assert_equal ship.name, 'Cruiser'
    assert_equal ship.body.length, 3

    ship = Ship.new(2)
    assert_equal ship.name, 'Submarine'
    assert_equal ship.body.length, 3

    ship = Ship.new(1)
    assert_equal ship.name, 'Destroyer'
    assert_equal ship.body.length, 2
  end

  def test_that_it_has_a_size
    ship = Ship.new(3)

    assert_equal ship.body.length, 3
  end

  def test_it_can_hold_cells
    ship = Ship.new(3)
    ship.occupy([@cell1, @cell2, @cell3])

    ship.body.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_it_is_not_hit
    ship = Ship.new(3)
    ship.occupy([@cell1, @cell2, @cell3])

    assert ship.body[0].not_hit?
  end

  def test_it_can_be_hit
    ship = Ship.new(3)
    ship.occupy([@cell1, @cell2, @cell3])
    @cell1.hit

    assert ship.body[0].hit?
  end

  def test_it_knows_it_is_not_sunk
    ship = Ship.new(3)
    ship.occupy([@cell1, @cell2, @cell3])

    refute ship.sunk?
  end

  def test_it_knows_it_is_sunk
    ship = Ship.new(3)
    ship.occupy([@cell1, @cell2, @cell3])

    ship.body.each { |cell| cell.hit }

    assert ship.sunk?
  end

  def test_it_occupies_cells
    ship = Ship.new(3)
    ship.occupy([@cell1, @cell2, @cell3])

    ship.body.each do |cell|
      assert cell.occupied?
    end
  end

end