require_relative 'battleship'

class Game

  attr_reader :players

  def initialize
    @on = false
  end

  def build(args)
    @difficulty = args[:difficulty]
    @players = args[:players]
  end

  def make_game
    system 'clear'
    @players.each { |player| player.get_name }
    @players.each { |player| player.place_ships }
    @on = true
    self
  end

  def play

    loop do
      system 'clear'
      Prompt.players_turn(player)
      
      player.draw(fog_off: true)
      player.draw_ships_sunk

      opponent.draw(fog_off: false)
      opponent.draw_ships_sunk

      player.hit(opponent.board)

      if win? then win end

      switch
    end

  end

  def win
    system 'clear'
    @players.each { |player| player.draw(fog_off: true) }
    Prompt.win!(player)
    @on = false
    $MENU.go!
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