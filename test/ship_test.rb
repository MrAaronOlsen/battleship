require_relative 'test_helper'

class ShipTest < Minitest::Test

  def  test_that_it_is_a_ship
    ship = Ship.new('cruiser')

    assert_instance_of Ship, ship
  end

  def test_that_it_has_a_name
    ship = Ship.new('cruiser')

    assert_equal ship.model.name, 'Cruiser'
  end

  def test_that_it_has_a_size
    ship = Ship.new('cruiser')

    assert_equal ship.model.body.length, 3
  end

  def test_it_holds_cells
    skip
    ship = ship.new('cruiser')

    ship.model.each do |cell|
      assert_instance_of Cell, cell
    end

  end

  def test_it_can_be_hit
    skip
    ship = ship.new('Cruiser')
    cell = ship.body[0]
    cell.hit

    assert ship.body[0].hit?
  end

  def test_it_knows_it_is_not_sunk
    skip
    ship = Ship.new('Cruiser')

    refute ship.sunk?
  end

  def test_it_knows_it_is_sunk
    skip
    ship = Ship.new('Cruiser')
    ship.body.each { |cell| cell.hit }

    assert ship.sunk?
  end

end