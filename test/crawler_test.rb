require_relative 'test_helper'
require_relative 'board_test_layouts'

class CrawlerTest < Minitest::Test

  def setup
    @board = Board.new
    @board.build
  end

  def test_that_it_is_a_crawler
    crawler = Crawler.new(@board)

    assert_instance_of Crawler, crawler
  end

  def test_that_holds_a_grid
    crawler = Crawler.new(@board)

    assert_equal crawler.grid, @board.grid
  end

  def test_that_it_maps_a_board
    crawler = Crawler.new(@board)

    assert_equal crawler.map, BoardTestLayouts.crawler_map_beginner
  end

  def test_that_it_can_collect_range_from_two_coords
    crawler = Crawler.new(@board)

    assert_equal crawler.collect_range( ['a3', 'a1'] ), ['a3', 'a2', 'a1']
    assert_equal crawler.collect_range( ['a1', 'c1'] ), ['a1', 'b1', 'c1']
  end

  def test_that_it_collects_ranges_for_a_ship_rght_dwn
    skip
    crawer = Crawler.new(@board)
    ship = Ship.new(3)
    placement = crawler.collect_ship( ship, ['a1'] )

    assert_equal placement, [ ['a1', 'a2', 'a3'],
                              ['a1', 'b1', 'c1'] ]
  end

  def test_that_it_collects_ranges_for_a_ship_lft_up
    skip
    crawer = Crawler.new(@board)
    ship = Ship.new(3)
    placement = crawler.collect_ship( ship, ['d4'] )

    assert_equal placement, [ ['d4', 'd3', 'd2'],
                              ['d4', 'c4', 'b4'] ]
  end

  def test_that_it_collects_ranges_for_a_ship_all
    skip
    board = Board.new(12)
    crawer = Crawler.new(board)
    ship = Ship.new(5)
    placement = crawler.collect_ship( ship, ['g6'] )

    assert_equal placement, [ ['g6', 'g7', 'g8', 'g9'],
                              ['g6', 'h6', 'h6', 'h6'],
                              ['g6', 'g5', 'g4', 'g3'],
                              ['g6', 'f6', 'e6', 'd6'] ]
  end

  def test_that_it_can_collects_ranges_with_ship_on_board
    skip
    crawer = Crawler.new(@board)
    board = Board.new
    board.build
    ship = Ship.new(2)

    cell1 = board.grid['c2']
    cell2 = board.grid['c3']
    cell3 = board.grid['c4']

    board.ships[0].occupy( [cell1, cell2, cell3] )

    placement = crawler.collect_ship( ship, ['b2'] )

    assert_equal placement, [ ['b2', 'b3', 'b4'] ]
  end

end