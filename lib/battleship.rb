puts "Welcome to Battleship"
puts "do you want to (P)lay, get the (I)nstructions or (Q)uit?"
require 'pry'
require './lib/computer_player'
require './lib/grid'
require './lib/player'



input = gets.chomp
until input == "Q" do
  if input == "P"
    #run the battleship game
    grid = Grid.new
    hp = Player.new
    cp = ComputerPlayer.new
  elsif input == "I"
    #go to the unstructions
  else
    puts "enter something real"
  end
  break
end
