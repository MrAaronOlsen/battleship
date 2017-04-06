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