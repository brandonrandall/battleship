require './lib/computer_player'
require './lib/player'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ComputerPlayerTest < Minitest::Test

  def test_computer_player_exists
    skip
    cp = ComputerPlayer.new
    assert_equal "Ready to DIE?", cp.start_talking
  end

  def test_computer_places_ships
    skip
    cp = ComputerPlayer.new
    cp.place_ship("D3")
  end

  def test_computer_places_a_one_by_one_tugboat
    skip
    computer_player = ComputerPlayer.new
    computer_player.place_coordinate(["D3"])
    assert_equal 'C', computer_player.computer_choice('D3')
  end

  def test_computer_places_a_ship
    skip
    computer_player = ComputerPlayer.new
    computer_player.place_coordinate(["D3", "D4"])
    assert_equal 'C', computer_player.computer_choice('D3')
    assert_equal 'C', computer_player.computer_choice('D4')
  end

  def test_computer_player_has_to_make_chained_choices
    skip
    cp = ComputerPlayer.new
    player = Player.new

    cp.place_ship1(["D3", "D4"])
    cp.place_ship2(["A3", "B3", "C3"])
    cp.print_grid_of_computer

    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])
    player.print_grid_of_player

    assert_equal 'C', cp.computer_choice('D3')
    assert_equal 'C', cp.computer_choice('D4')
    assert_equal 'C', cp.computer_choice('A3')
    assert_equal 'C', cp.computer_choice('B3')
    assert_equal 'C', cp.computer_choice('C3')

  end

  def test_coordinates_are_replaced_hit_or_miss_if_guessed
    # skip
    cp = ComputerPlayer.new
    player = Player.new

    cp.computer_grid.grid["D3"] = "C"
    cp.computer_grid.grid["D4"] = "C"

    cp.computer_grid.grid["A1"] = "C"
    cp.computer_grid.grid["B1"] = "C"
    cp.computer_grid.grid["C1"] = "C"


    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])

    cp_input = ['A1']
    player_input = ['C1']

    player.computer_guess(cp_input)
    cp.player_guess(player_input)

    player.printable_enemy_grid
    cp.print_grid_of_computer
  end

  def test_horiz_placement_cant_overlap
    cp = ComputerPlayer.new
    horiz_array = [ "A1", "A2", "A3",
                    "B1", "B2", "B3",
                    "C1", "C2", "C3",
                    "D1", "D2", "D3",
                  ]
    cp.long_horiz_placement(horiz_array)
  end

end
