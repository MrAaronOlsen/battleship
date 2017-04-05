require_relative 'battleship'

class Game

  attr_reader :players

  def initialize(player1 = Human.new, player2 = Ai.new, difficulty = 4)
    @difficulty = difficulty
    @players = [player1, player2]
  end

  def make_game
    @players.each { |player| player.get_name }
    @players.each { |player| player.place_ships }
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