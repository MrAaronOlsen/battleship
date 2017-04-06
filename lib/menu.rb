require_relative 'battleship'

class Menu

  def initialize
    @difficulty = 4
    @players = [Human.new(@difficulty), Ai.new(@difficulty)]
  end

  def go!
    splash_screen
    options
  end

  def splash_screen
    system 'clear'
    puts "Battleship"
  end

  def instructions
    system 'clear'
    puts "Win the game by trying to sink your opponents ships!"
    puts "Enter placements letter first than number, like b6."
    puts "Enter Exit! anytime to quit to desktop."
    puts "Enter Menu! anytime to return back to the menu"
    puts "Good luck!"
    print "Any Key to go back: "
    input = gets.chomp
    go!
  end

  def options
    splash_screen
    puts "\nPlayer 1: #{@players[0].type}, Player 2: #{@players[1].type}, Difficult: #{@difficulty}"
    print "\n(S)tart, (D)ifficulty, (P)layers, (E)xit..: "
    input = gets.chomp.downcase
    if valid_input?(input, ['s', 'd', 'p', 'x'])
      if input == 's'
        start
      elsif input == 'd'
        change_difficulty
      elsif input == 'p'
        change_players
      elsif input == 'x'
        exit
      end
    end
    options
  end

  def change_difficulty
    splash_screen
    puts "Current Difficult: #{@difficulty}"
    puts "\n\n(4) Beginnger"
    puts "(8) Intermediate"
    puts "(12) Advanced"
    puts "(B)ack"
    print "\n\nEnter a difficulty: "
    input = gets.chomp.downcase
    if valid_input?(input, ['4', '8', '12', 'b'])
      if input == 'b'
        options
      else
        @difficulty = input.to_i
      end
    end
    change_difficulty
  end

  def change_players
    splash_screen
    puts "(F)irst player: #{@players[0].type}"
    puts "(S)econd player: #{@players[1].type}"
    puts "(B)ack"
    print "\n\nEnter player to change: "
    input = gets.chomp.downcase
    if valid_input?(input, ['f', 's', 'b'] )
      if input == 'f'
        @players[0] = change_player
      elsif input == 's'
        @players[1] = change_player
      elsif input == 'b'
        options
      end
    end
    change_players
  end

  def change_player
    print "\n(H)uman, (C)omputer: "
    input = gets.chomp.downcase
    if valid_input?(input, ['h', 'c'])
      if input == 'h'
        return Human.new(@difficulty)
      else
        return Ai.new(@difficulty)
      end
      change_players
    end

    change_player
  end

  def valid_input?(user, check)
    check.include?(user)
  end

  def start
    @players[0].size = @difficulty
    @players[1].size = @difficulty
    binding.pry
    @game = Game.new(@players[0], @players[1], @difficulty)
    @game.make_game
    @game.play
  end

  def quit
    exit!
  end

end