require './lib/computer_board'
require './lib/grid'

class PlayerOtherGrid

  # needs to bring in a screen that reads the
  # hits of the other player

    attr_accessor :computer_grid

    def initialize
      @computer_grid = Grid.new
    end

    def start_talking
      p "Ready to DIE?"
    end

    def place_coordinate(coordinate)
      @computer_grid.add_coordinate_to_grid("H", coordinate)
    end

    def place_ship1(coordinate)
      @computer_grid.add_coordinate_to_grid("H", coordinate)
    end

    def place_ship2(coordinate)
      @computer_grid.add_coordinate_to_grid("H", coordinate)
    end

    def player_choice(coordinates)
      @computer_grid.grid[coordinates]
    end

end
