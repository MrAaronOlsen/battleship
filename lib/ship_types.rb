module ShipTypes

  Type = Struct.new(:name, :body)

  def build
    { 'carrier' => carrier,
      'battleship' => battleship,
      'cruiser' => cruiser,
      'submarine' => submarine,
      'destroyer' => destroyer }
  end

  def carrier
    Type.new( 'Carrier', Array.new(5) )
  end

  def battleship
    Type.new( 'Battleship', Array.new(4) )
  end

  def cruiser
    Type.new( 'Cruiser', Array.new(3) )
  end

  def submarine
    Type.new( 'Submarine', Array.new(3) )
  end

  def destroyer
    Type.new( 'Destroyer', Array.new(2) )
  end

end