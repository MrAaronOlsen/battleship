require_relative 'battleship'

class Game

  attr_reader :players

  def initialize(player1, player2, difficulty)
    @difficulty = difficulty
    @players = [player1, player2]
  end

  def make_game
    system 'clear'
    binding.pry
    @players.each { |player| player.get_name }
    @players.each { |player| player.place_ships }
  end

  def play
    loop do
      system 'clear'
      player.draw_board
      opponent.draw_fog
      player.hit(opponent.board)
      if win?
        system 'clear'
        player.draw_board
        opponent.draw_board
        puts "#{player.name} Wins!"
        break
      end
      switch
    end
  end

  def win?
    opponent.fleet_sunk?
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