require_relative 'test_helper'

class ShipTypeTest < Minitest::Test
  include ShipTypes

  def test_carrier_has_name_and_body
    ship = build['carrier']

    assert_equal ship.name, 'Carrier'
    assert_equal ship.body, [nil, nil, nil, nil, nil]
  end

  def test_battleship_has_name_and_body
    ship = build['battleship']

    assert_equal ship.name, 'Battleship'
    assert_equal ship.body, [nil, nil, nil, nil]
  end

  def test_cruiser_has_name_and_body
    ship = build['cruiser']

    assert_equal ship.name, 'Cruiser'
    assert_equal ship.body, [nil, nil, nil]
  end

  def test_submarine_has_name_and_body
    ship = build['submarine']

    assert_equal ship.name, 'Submarine'
    assert_equal ship.body, [nil, nil, nil]
  end

  def test_destroyer_has_name_and_body
    ship = build['destroyer']

    assert_equal ship.name, 'Destroyer'
    assert_equal ship.body, [nil, nil]
  end
  
end