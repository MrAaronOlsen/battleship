require_relative 'test_helper'

class ShipTest < Minitest::Test

  def  test_that_it_is_a_ship
    ship = Ship.new

    assert_instance_of Ship, ship
  end

  def test_that_it_is_nil_when_created
    ship = Ship.new

    assert_nil ship.type
  end

  def test_that_size_is_zero_when_created
    ship = Ship.new

    assert ship.body.empty?
  end

  def test_that_it_can_be_a_type_of_ship
    ship = Ship.new('Cruiser')

    assert_equal ship.type, 'Cruiser'
  end

  def test_that_it_can_have_a_size_based_on_type
    ship = Ship.new('Cruiser')

    assert_equal ship.body.length, 3
  end

  def test_all_types_and_sizes
    ship = Ship.new('Carrier')
    assert_equal ship.body.length, 5
    ship = Ship.new('Battleship')
    assert_equal ship.body.length, 4
    ship = Ship.new('Cruiser')
    assert_equal ship.body.length, 3
    ship = Ship.new('Submarine')
    assert_equal ship.body.length, 3
    ship = Ship.new('Destroyer')
    assert_equal ship.body.length, 2
  end

  def test_it_holds_cells
    ship = ship.new('Cruiser')

    ship.body.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_it_can_be_hit
    ship = ship.new('Cruiser')
    cell = ship.body[0]
    cell.hit

    assert ship.body[0].hit?
  end

  def test_it_knows_it_is_not_sunk
    ship = Ship.new('Cruiser')

    refute ship.sunk?
  end

  def test_it_knows_it_is_sunk
    ship = Ship.new('Cruiser')
    ship.body.each { |cell| cell.hit }

    assert ship.sunk?
  end

end