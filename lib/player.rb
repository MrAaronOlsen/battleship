require_relative 'battleship'

class Player

  attr_reader :name, :board, :ships

  def initialize(name)
    @name = name
    @board = nil
    @ships = []
  end

  def assign(board)
    @board = board
  end

  def give(ships)
    ships.each { |ship| @ships << ship }
  end

end