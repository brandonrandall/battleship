require './lib/grid'


class Player

    attr_accessor :computer_grid

    def initialize

      @player_grid = Grid.new
      @printable_grid = Grid.new
    end

    def computer_guess(guess)
      @player_grid.replace_with_hit_or_miss(guess,  @printable_grid)
    end

    def place_coordinate(coordinate)
      @player_grid.add_coordinate_to_grid("H", coordinate)
    end

    def place_ship1(coordinate)
      @player_grid.add_coordinate_to_grid("H", coordinate)
    end

    def place_ship2(coordinate)
      @player_grid.add_coordinate_to_grid("H", coordinate)
    end

    def print_grid_of_player
      @player_grid.print_layout
    end

    def printable_enemy_grid
      @printable_grid.print_layout
    end

    def player_choice(coordinates)
      @player_grid.grid[coordinates]
    end

end
