require_relative 'battleship'

class Game

  attr_reader :players

  def initialize(difficulty = 4)
    @players = [Player.new(difficulty), Ai.new(difficulty)]
    play
  end

  def play
    loop do
      system 'clear'
      player.draw_board
      opponent.draw_fog
      player.hit(opponent.board)
      switch
    end
  end

  def switch
    @players.reverse!
  end

  def player
    @players[0]
  end

  def opponent
    @players[1]
  end

end