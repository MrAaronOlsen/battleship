module Prompt

  class << self

    def get_name
      print "Enter your name: "
      gets.chomp
    end

    def get_ship_coords(ship, player)
      puts "\n#{player.name}"
      puts "\nPlace #{ship.name}: #{ship.draw.yellow}"
      puts "Size: #{ship.size} units."
      print "Enter coordinates: "
      coordinates = gets.chomp

      if coordinates.empty?
        [nil]
      else
        coordinates.split(" ")
      end
    end

    def get_hit_coord
      print "Enter a coordinate to strike: "
      gets.chomp
    end

    def player_board(player)
      puts "\n#{player.name}'s turn.\n\n"
    end

    def win!(player)
      puts "\n#{player.name} Wins!"
      sleep(2)
    end

    def made_hit!
      puts "\nYou hit a ship!"
      sleep(2)
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
    end

  end


end