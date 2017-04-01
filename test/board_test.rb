require_relative 'test_helper'

class BoardTest < Minitest::Test

  def test_that_it_is_a_board
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that
end