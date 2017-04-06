require_relative 'battleship'

class Game

  attr_reader :players

  def initialize(player1 = Human.new, player2 = Ai.new, difficulty = 4)
    @difficulty = difficulty
    @players = [player1, player2]
    @on = false
  end

  def make_game
    system 'clear'
    @players.each { |player| player.get_name }
    @players.each { |player| player.place_ships }
    @on = true
  end

  def play

    loop do
      system 'clear'
      Prompt.player_board(player)
      player.draw_board
      player.draw_ships_sunk

      opponent.draw_fog
      opponent.draw_ships_sunk

      player.hit(opponent.board)
      if win?
        system 'clear'
        player.draw_board
        opponent.draw_board
        Prompt.win!(player)
        @on = false
        break
      end

      switch
    end

  end

  def win?
    opponent.fleet_sunk?
  end

  def on?
    @on
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