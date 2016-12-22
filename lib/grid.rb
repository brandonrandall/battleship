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

  def add_coordinate_to_grid(owner_letter, coordinates)
    # binding.pry

    @grid.each do |coord_in_grid,spacer|
      coordinates.each do |coordinate|
        if coord_in_grid == coordinate
          @grid[coord_in_grid] = owner_letter
        end
      end
    end
  end

  def replace_with_hit_or_miss(guess, printable_grid)
    # binding.pry
    if @grid[guess[0]] == "H" || @grid[guess[0]] == "C"
      printable_grid.grid[guess[0]] = "X"
    elsif @grid[guess[0]] != "H" || @grid[guess[0]] != "C"
      printable_grid.grid[guess[0]] = "M"
    end

    # @grid.each do |k,i|
    #   if cp_input[0] == k || player_input[0] == k
    #     @grid[k] = "X"
    #   end

      # if
      # elsif player_input[0] == k
      #   @grid[k] = "X"
      # elsif player_input[0] != k
      #   @grid[k] = "M"
      # else cp_input[0] == nil || player_input[0] == nil
      #   @grid[k]
      # end
    # end
    # print_layout
  end

end


  # def grid_layout
  #   row = Array.new(4, "-")
  #   rows_n_columns = row.map { |row| Array.new(4, "-")}
  # end
  #
  # def id_creator
  #   grid_layout
  #   row_id = ("A".."D").to_a
  #   column_id = (1..4).to_a
  #
  #   print "\t"
  #   print row_id.join("\t")
  #   puts
  #   laid_out = grid_layout.each_with_index do |row, i|
  #     print column_id[i]
  #     print "\t"
  #     print row.join("\t")
  #     puts
  #     # binding.pry
  #   end
  # end

  #   #if computer_player makes choices, they will be stored
