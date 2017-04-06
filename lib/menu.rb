require_relative 'battleship'

class Menu

  def initialize(difficulty = 4)
    $MENU = self
    @game = Game.new
    @difficulty = difficulty
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

  def options
    splash_screen

    if @game.on? then puts "\nGame in Progress...\n" end
    puts "\nPlayer 1: #{@players[0].type}"
    puts "Player 2: #{@players[1].type}"
    puts "Difficulty: #{@difficulty}\n\n"

    if @game.on? then print "(C)ontinue, " end
    print "(S)tart, (I)nstructions, (D)ifficulty, (P)layers, (E)xit..: "

    input = gets.chomp.downcase
    if valid_input?(input, ['s', 'd', 'i', 'p', 'e', 'c'])
      case input
      when 's'
        start
      when 'i'
        instructions
      when 'd'
        change_difficulty
      when 'p'
        change_players
      when 'e'
        quit
      when 'c'
        @game.play
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
    puts "\n(F)irst player: #{@players[0].type}"
    puts "(S)econd player: #{@players[1].type}"
    puts "(B)ack"
    print "\nEnter player to change: "
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
    print "\n\n(H)uman, (C)omputer: "
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

  def instructions
    system 'clear'
    puts "Win the game by trying to sink all your opponents ships!"
    puts "Enter placements letter first than number, like b6."
    puts "Two boards are displayed. The top board shows your ships, "
    puts "and the second board shows where you have struck you opponent!"
    puts "Track how many ships you've sunked by the '#'s under each board."
    puts "Enter Exit! anytime to quit to desktop."
    puts "Enter Menu! anytime to return back to the menu"
    puts "Good luck!\n\n"
    print "Hit enter to go back: "
    input = gets.chomp
    go!
  end

  def valid_input?(user, check)
    check.include?(user)
  end

  def start
    @players.each do |player|
      player.size = @difficulty
      player.assign_board(@difficulty)
      player.assign_ships
    end

    @game = Game.new(@players[0], @players[1], @difficulty)
    @game.make_game
    @game.play
  end

  def call?(input)
    if input == 'Exit' || input == 'exit'
      quit
    elsif input == 'Menu' || input == 'menu'
      go!
    end
  end

  def quit
    system 'clear'
    puts "\n\nThank you for playing Battleship!"
    sleep(5)
    system 'clear'
    exit!
  end

end