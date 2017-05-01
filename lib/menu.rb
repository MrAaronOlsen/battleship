require_relative 'battleship'
require_relative 'menu_module'

class Menu
  include MenuModule

  def initialize
    $MENU = self

    @game = Game.new
    @difficulty = 4
    @players = [Human.new, Ai.new]
  end

  def go!
    splash_screen
    options
  end

  def start
    @players.each { |player| player.build(@difficulty) }

    @game.build(players: @players,
                difficulty: @difficulty)
    @game.make_game.play
  end

end