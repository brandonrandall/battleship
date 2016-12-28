require 'minitest/autorun'
require './lib/battleship'
require 'minitest/emoji'
require 'pry'

class BattleshipTest < Minitest::Test

  def test_battleship_receives_input
    skip
    battleship = Battleship.new
    assert_equal String, battleship
  end

  # def test_can_validate_ship_coordinates_input_is_correct
  #   battleship = Battleship.new
  #   battleship
  # end

  def test_can_start_game
    battleship = Battleship.new
    battleship.input_player_coordinates("A1 A2", 1)
    assert_equal ({ "A1" =>  "H",  "A2"=>"H", "A3"=>"-", "A4"=>  "-",
                  "B1" =>  "-",  "B2"=>"-", "B3"=>"-", "B4"=>  "-",
                  "C1" =>  "-",  "C2"=>"-", "C3"=>"-", "C4"=>  "-",
                  "D1" =>  "-",  "D2"=>"-", "D3"=>"-", "D4"=>  "-"}),
                  battleship.player_grid

    battleship.input_player_coordinates("D2 D3 D4", 2)
    assert_equal ({ "A1" =>  "H",  "A2"=>"H", "A3"=>"-", "A4"=>  "-",
                  "B1" =>  "-",  "B2"=>"-", "B3"=>"-", "B4"=>  "-",
                  "C1" =>  "-",  "C2"=>"-", "C3"=>"-", "C4"=>  "-",
                  "D1" =>  "-",  "D2"=>"H", "D3"=>"H", "D4"=>  "H"}),
                  battleship.player_grid
  end

  def test_ships_cant_overlap
    battleship = Battleship.new

    battleship.input_player_coordinates("A1 A2", 1)

    assert_equal ({ "A1" =>  "H",  "A2"=>"H", "A3"=>"-", "A4"=>  "-",
                  "B1" =>  "-",  "B2"=>"-", "B3"=>"-", "B4"=>  "-",
                  "C1" =>  "-",  "C2"=>"-", "C3"=>"-", "C4"=>  "-",
                  "D1" =>  "-",  "D2"=>"-", "D3"=>"-", "D4"=>  "-"}),
                  battleship.player_grid
    occupied = battleship.input_player_coordinates("A2 B2 C2", 2)
    assert_equal "A2 is already occupied", occupied
    assert_equal ({ "A1" =>  "H",  "A2"=>"H", "A3"=>"-", "A4"=>  "-",
                  "B1" =>  "-",  "B2"=>"-", "B3"=>"-", "B4"=>  "-",
                  "C1" =>  "-",  "C2"=>"-", "C3"=>"-", "C4"=>  "-",
                  "D1" =>  "-",  "D2"=>"-", "D3"=>"-", "D4"=>  "-"}),
                  battleship.player_grid


  end
end
