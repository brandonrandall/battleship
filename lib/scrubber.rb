module Scrubber

  def self.caps(input)
    input.upcase
  end

  def self.first_ship_validate(first_ship_coordinates)
    if first_ship_coordinates.split.length == 2
      self.caps(first_ship_coordinates)
    end
  end

  def self.second_ship_validate(second_ship_coordinates)
    if second_ship_coordinates.split.length == 3
      self.caps(second_ship_coordinates)
    end
  end

end
