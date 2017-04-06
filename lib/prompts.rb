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

  end


end