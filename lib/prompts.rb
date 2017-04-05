module Prompt

  class << self

    def get_name
      print "Enter your name: "
      gets.chomp
    end

    def get_ship_coords(ship)
      puts "#{ship.name}: #{ship.draw.yellow}"
      puts "Size: #{ship.size} units."
      print "Enter coordinates: "
      coordinates = gets.chomp
      coordinates.split(" ")
    end
    
  end

end