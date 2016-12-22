require './lib/grid'

class ComputerPlayer

  attr_accessor :computer_grid

  def initialize
    @computer_grid = Grid.new
    @printable_grid = Grid.new
  end

  def start_talking
    p "Ready to DIE?"
  end

  def player_guess(guess)
    @computer_grid.replace_with_hit_or_miss(guess, @printable_grid)
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

  def print_grid_of_computer
    computer_grid.print_layout
  end

  def printable_enemy_grid
    @printable_grid.print_layout
  end

  def computer_choice(coordinates)
    # binding.pry
    computer_grid.grid[coordinates]
  end


end


#needs to autochoose random coordinates
#on the board
# if computer chooses something like (A1, B1) it places a ship
#if game starts
#need to generate a grid to place the ships
# grid = Grid.new
