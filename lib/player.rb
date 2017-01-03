require './lib/grid'


class Player

    attr_accessor :computer_grid, :player_grid, :occupied_message

    def initialize
      @player_grid = Grid.new
      @printable_grid = Grid.new
      @occupied_message = ""
    end

    def ships_sunk?
      player_ships = @player_grid.grid.select { |key, value| value == "H"}.keys
      cp_guesses = @printable_grid.grid.select { |key, value| value == "X"}.keys
      if player_ships == cp_guesses
        puts "
        GAME OVER, Computer won
        "
      else
        false
      end
    end

    def computer_guess(guess)
      # binding.pry
      @player_grid.replace_with_hit_miss_or_sunk(guess,  @printable_grid)
    end

    def place_coordinate(coordinate)
      @player_grid.add_coordinate_to_grid("H", coordinate)
    end

    def place_ship1(coordinate)
      @player_grid.add_coordinate_to_grid("H", coordinate)
    end

    def place_ship2(coordinate)
      already_occupied = @player_grid.add_coordinate_to_grid("H", coordinate)
      valid_check(already_occupied)
    end

    def valid_check(already_occupied)
      # binding.pry
      unless already_occupied.empty?
        @occupied_message = "#{already_occupied.join(", ")} is already occupied"
        # binding.pry
      end
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
