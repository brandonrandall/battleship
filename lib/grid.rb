require './lib/computer_player'

class Grid


  def initialize
    @grid = { "A1" =>  "-",  "A2"=>"-", "A3"=>"-", "A4"=>  "-",
              "B1" =>  "-",  "B2"=>"-", "B3"=>"-", "B4"=>  "-",
              "C1" =>  "-",  "C2"=>"-", "C3"=>"-", "C4"=>  "-",
              "D1" =>  "-",  "D2"=>"-", "D3"=>"-", "D4"=>  "-"}
  end

  def print_layout
    letters = {0=>"A", 1=>"B", 2=>"C", 3=>"D"}
    coordinates_1 = @grid.each_slice(4).map { |row| p row.to_h }
    values = coordinates_1.map { |row| row.map { |k,v| v}}
    puts ". 1 2 3 4"
    @print = values.each_with_index do |row, i|
      join = row.join(" ")
      puts "#{letters[i]} #{join}"
    end
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
