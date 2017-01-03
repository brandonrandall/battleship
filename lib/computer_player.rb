require './lib/grid'
require './lib/player'

class ComputerPlayer

  attr_accessor :computer_grid

  def initialize
    @computer_grid = Grid.new
    @printable_grid = Grid.new
    @base_array = [ "A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4",
                  ]
  end

  def commencement
    place_ship1(coordinate)
    place_ship2(coordinate)
  end

  def ships_sunk?
    cp_ships = @computer_grid.grid.select { |key, value| value == "C"}.keys
    player_guesses = @printable_grid.grid.select { |key, value| value == "X"}.keys
    if cp_ships == player_guesses
      puts "
      GAME OVER, Player won
      "
    else
      false
    end
  end

  def random_computer_guess
    @printable_grid.grid.keys.sample(1)
  end

  def player_guess(guess)
    @computer_grid.replace_with_hit_miss_or_sunk(guess, @printable_grid)
  end

  def place_coordinate(coordinate)
    computer_grid.add_coordinate_to_grid("C", coordinate)
  end

  def place_ship1
    horiz_array = [ "A1", "A2", "A3",
                    "B1", "B2", "B3",
                    "C1", "C2", "C3",
                    "D1", "D2", "D3",
                  ]
    vert_array =  [ "A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                  ]
    direction_on_axis = rand(2)
    if direction_on_axis == 0
      horiz_placement(horiz_array)
    else
      vert_placement(vert_array)
    end
  end

  def place_ship2
    long_horiz_array = [ "A1", "A2",
                    "B1", "B2",
                    "C1", "C2",
                    "D1", "D2",
                  ]
    long_vert_array =  [ "A1", "A2", "A3", "A4",
                    "B1", "B2", "B3", "B4",
                  ]

    direction_on_axis = rand(2)

    if direction_on_axis == 0
      binding.pry
      long_horiz_placement(long_horiz_array)
    else
      long_vert_placement(long_vert_array)
    end
  end

  def horiz_placement(horiz_array)
    starting_point = horiz_array.sample
    start_index = @base_array.index(starting_point)
    placement_spots = [@base_array[start_index], @base_array[start_index + 1]]
    placement_spots.each do |e|
      @computer_grid.grid[e] = 'C'
    end
  end

  def vert_placement(vert_array)
    starting_point = vert_array.sample
    start_index = @base_array.index(starting_point)
    placement_spots = [@base_array[start_index], @base_array[start_index + 4]]
    placement_spots.each do |e|
      @computer_grid.grid[e] = 'C'
    end
  end

  def long_horiz_placement(horiz_array)
    long_starting_point = horiz_array.sample
    # until @computer_grid.grid[long_starting_point] == "-"
    #   long_starting_point = horiz_array.sample
    # end
    # binding.pry
    start_index = @base_array.index(long_starting_point)
    
    placement_spots = [ @base_array[start_index],
                        @base_array[start_index + 1],
                        @base_array[start_index + 2]]
    placement_spots.each do |e|
      @computer_grid.grid[e] = 'C'
    end
  end

  def long_vert_placement(vert_array)
    long_starting_point = vert_array.sample
    # until @computer_grid.grid[long_starting_point] == "-"
    #   binding.pry
    #   long_starting_point = vert_array.sample
    # end
    # binding.pry
    start_index = @base_array.index(long_starting_point)
    placement_spots = [ @base_array[start_index],
                        @base_array[start_index + 4],
                        @base_array[start_index + 8]]
    placement_spots.each do |e|
      @computer_grid.grid[e] = 'C'
    end
  end

  def print_grid_of_computer
    computer_grid.print_layout
  end

  def printable_enemy_grid
    @printable_grid.print_layout
  end

  def computer_choice(coordinates)
    computer_grid.grid[coordinates]
  end

end
