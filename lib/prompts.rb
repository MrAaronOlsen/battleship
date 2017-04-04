module Prompts

  def get_name
    print "Enter your name: "
    gets.chomp
  end

  def get_ship_coords(ship)
    print "Enter coordinates for your #{ship.name}: "
    coordinates = gets.chomp
    coordinates.split(" ")
  end

end