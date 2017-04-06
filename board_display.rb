require 'pry'
require './lib/battleship'

game = Game.new
game.make_game

game.players.each { |player| player.draw_board }