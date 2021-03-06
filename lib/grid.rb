require './lib/computer_player'
require './lib/player'

class Grid

  attr_reader :grid

  def initialize
    @grid = { "A1" =>  "-",  "A2"=>"-", "A3"=>"-", "A4"=>  "-",
              "B1" =>  "-",  "B2"=>"-", "B3"=>"-", "B4"=>  "-",
              "C1" =>  "-",  "C2"=>"-", "C3"=>"-", "C4"=>  "-",
              "D1" =>  "-",  "D2"=>"-", "D3"=>"-", "D4"=>  "-"}
  end

  def print_layout
    letters = {0=>"A", 1=>"B", 2=>"C", 3=>"D"}
    coordinates_1 = @grid.each_slice(4).map { |row| row.to_h }
    values = coordinates_1.map { |row| row.map { |k,v| v}}
    puts ". 1 2 3 4"
    @print = values.each_with_index do |row, i|
      join = row.join(" ")
      puts "#{letters[i]} #{join}"
    end
  end

  def not_valid_coordinates?(coordinates)
    invalid_coord = @grid.select { |key, value| value != "-" }.keys
    coordinates.group_by do |coordinate|
      # stopping place (figure out how to make this work.)m
      invalid_coord.include?(coordinate)
    end
  end

  def add_coordinate_to_grid(owner_letter, coordinates)
    value = not_valid_coordinates?(coordinates)
    return valid[true] unless value[true].nil?
    already_occupied_coordinates = []
    @grid.each do |coord_in_grid,spacer|
      coordinates.each do |coordinate|
        if coord_in_grid == coordinate
          @grid[coord_in_grid] = owner_letter
        end
      end
    end
    already_occupied_coordinates
  end

  def replace_with_hit_miss_or_sunk(guess, printable_grid)
    if @grid[guess[0]] == "H" || @grid[guess[0]] == "C"
      printable_grid.grid[guess[0]] = "X"
    elsif @grid[guess[0]] != "H" || @grid[guess[0]] != "C"
      printable_grid.grid[guess[0]] = "M"
    end
  end
end
