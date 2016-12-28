puts "Welcome to Battleship"
puts "do you want to (P)lay, get the (I)nstructions or (Q)uit?"

require './lib/computer_player'
require './lib/grid'
require './lib/player'
require './lib/scrubber'
require 'pry'

class Battleship

  include Scrubber

def initialize
  @player = Player.new
  @cp= ComputerPlayer.new
end

  def begin_game
    input = gets.chomp
    until input == "Q" do
      if input == "P"
        place_and_verify_coordinates
        start_and_play_game
      elsif input == "I"
        #go to the unstructions
        ins = File.read("instructions.txt")
        puts ins
      else
        puts "
        enter something real
        "
      end
      break
    end
  end

  def start_and_play_game
    until @cp.ships_sunk? || @player.ships_sunk?
      puts "
      PLAYER, MAKE A GUESS
      "
      @cp.printable_enemy_grid
      guess = gets.chomp
      player_guessed = guess.upcase.split

      @cp.player_guess(player_guessed)
      @cp.printable_enemy_grid
      puts "
      Computer made a guess.
      "

      computer_guess = @cp.random_computer_guess
      @player.computer_guess(computer_guess)
      @player.printable_enemy_grid
    end
  end

  def place_and_verify_coordinates
    puts "Place your first ship"
    puts "Where you wan place it?"
    first_ship_coordinates = gets.chomp
    scrubber = first_scrub(first_ship_coordinates)

    input_player_coordinates(scrubber, 1)

    puts "Place your second ship"
    puts "Where you wan place it?"
    second_ship_coordinates = gets.chomp
    second_scrubber = second_scrub(second_ship_coordinates)
    occupied = input_player_coordinates(second_scrubber, 2)

    until occupied == nil
      puts occupied
      puts "re enter coordinates for second ship"
      next_placement = gets.chomp
      second_scrubber = second_scrub(next_placement)
      occupied = input_player_coordinates(second_scrubber, 2)
    end
    place_computer_ships
  end

  def place_computer_ships
    @cp.place_ship1
    # binding.pry
    @cp.place_ship2
  end

  def first_scrub(first_ship_coordinates)
    scrubber = Scrubber.first_ship_validate(first_ship_coordinates)
    until scrubber
      puts "enter 2 coordinates for first ship"
      first_ship_coordinates = gets.chomp
      scrubber  = Scrubber.first_ship_validate(first_ship_coordinates)
    end
    scrubber
  end

  def second_scrub(second_ship_coordinates)
    scrubber = Scrubber.second_ship_validate(second_ship_coordinates)
    until scrubber
      puts "enter 3 coordinates for second ship"
      second_ship_coordinates = gets.chomp
      scrubber  = Scrubber.second_ship_validate(second_ship_coordinates)
    end
    scrubber
  end


  def input_player_coordinates(coordinates, ship_number)
    coordinates = coordinates.split
    if ship_number == 1
      # binding.pry
      valid_description = @player.place_ship1(coordinates)
    elsif ship_number == 2
      @player.place_ship2(coordinates)
    end
  end

  def player_grid
    @player.player_grid.grid
  end

end

battleship = Battleship.new
battleship.begin_game
