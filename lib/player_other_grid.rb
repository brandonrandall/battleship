require './lib/grid'
require './lib/computer_player'

class PlayerOtherGrid

  # needs to bring in a screen that reads the
  # hits of the other player

    attr_accessor :computer_grid

    def initialize
      
      @computer_grid = Grid.new
    end

    def place_coordinate(coordinate)
      computer_grid.add_coordinate_to_grid("C", coordinate)
    end

    def place_ship1(coordinate)
      computer_grid.add_coordinate_to_grid("C", coordinate)
    end

    def place_ship2(coordinate)
      computer_grid.add_coordinate_to_grid("C", coordinate)
    end

    def computer_choice(coordinates)
      computer_grid.grid[coordinates]
    end

end
