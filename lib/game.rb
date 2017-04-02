require_relative 'battleship'

class Game

  attr_reader :players, :turn

  def initialize(player1, player2)
    @players = { 1 => player1, -1 => player2 }
    @turn = 1
  end

  def switch
    @turn *= -1
  end

  def current_player
    @players[turn]
  end

end