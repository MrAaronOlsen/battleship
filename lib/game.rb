require_relative 'battleship'

class Game

  def initialize(difficulty)
    @players = [Player.new(difficulty), AI.new(difficulty)]
  end 

  def switch
    @players.reverse!
  end

  def current_player
    @players[0]
  end

  def opponent
    @player[1]
  end

end