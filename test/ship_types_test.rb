require_relative 'test_helper'

class ShipTypeTest < Minitest::Test
  include ShipTypes

  def test_carrier_has_name_and_body
    ship = build['carrier']

    assert_equal ship.name, 'Carrier'
    assert_equal ship.body, [nil, nil, nil, nil, nil]
  end
end