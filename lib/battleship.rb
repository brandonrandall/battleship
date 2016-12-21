puts "Welcome to Battleship"
puts "do you want to (P)lay, get the (I)nstructions or (Q)uit?"
require 'pry'

input = gets.chomp
# binding.pry
until input == "Q" do
  if input == "P"
    #run the battleship game
  elsif input == "I"
    #go to the unstructions
  else
    puts "enter something real"
  end
  break
end
