module MenuModule

  def splash_screen
    system 'clear'
    puts "Battleship"
  end

  def options
    splash_screen
    options_menu

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

  def change_player
    print "\n\n(H)uman, (C)omputer: "
    input = gets.chomp.downcase
    if valid_input?(input, ['h', 'c'])
      if input == 'h'
        return Human.new
      else
        return Ai.new
      end
      change_players
    end

    change_player
  end

  def change_difficulty
    splash_screen
    change_difficulty_menu

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
    change_players_menu

    input = gets.chomp.downcase
    if valid_input?(input, ['f', 's', 'b'] )
      case input
      when 'f'
        @players[0] = change_player
      when 's'
        @players[1] = change_player
      when 'b'
        options
      end
    end
    change_players
  end

  def options_menu
    if @game.on? then puts "\nGame in Progress...\n" end
    puts "\nPlayer 1: #{@players[0].type}"
    puts "Player 2: #{@players[1].type}"
    puts "Difficulty: #{@difficulty}\n\n"
    if @game.on? then print "(C)ontinue, " end
    print "(S)tart, (I)nstructions, (D)ifficulty, (P)layers, (E)xit..: "
  end


  def change_players_menu
    puts "\n(F)irst player: #{@players[0].type}"
    puts "(S)econd player: #{@players[1].type}"
    puts "(B)ack"
    print "\nEnter player to change: "
  end

  def change_difficulty_menu
    puts "Current Difficult: #{@difficulty}"
    puts "\n\n(4) Beginnger"
    puts "(8) Intermediate"
    puts "(12) Advanced"
    puts "(B)ack"
    print "\n\nEnter a difficulty: "
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

  def quit
    system 'clear'
    puts "\n\nThank you for playing Battleship!"
    sleep(2)
    system 'clear'
    exit!
  end

  def call?(input)
    if input == 'Exit' || input == 'exit'
      quit
    elsif input == 'Menu' || input == 'menu'
      go!
    end
  end

  def valid_input?(user, check)
    check.include?(user)
  end

end