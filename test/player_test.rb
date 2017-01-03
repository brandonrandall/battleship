require './lib/computer_player'
require './lib/player'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class PlayerTest < Minitest::Test

  def test_player_places_ships
    skip
    hp = Player.new
    hp.place_ship("D3")
  end

  def test_player_places_a_one_by_one_tugboat
    skip
    player = Player.new
    player_player.place_coordinate(["D3"])
    assert_equal 'H', player.player_choice('D3')
  end

  def test_player_places_a_ship
    skip
    #test hp can choose 2 coordinates to place first ship
    player = Player.new
    player.place_coordinate(["D3", "D4"])
    assert_equal 'H', player.player_choice('D3')
    assert_equal 'H', player.player_choice('D4')
  end

  def test_player_has_to_make_chained_choices
    skip
    player = Player.new
    cp = ComputerPlayer.new

    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])
    player.print_grid_of_player

    cp.place_ship1(["D3", "D4"])
    cp.place_ship2(["A3", "B3", "C3"])
    cp.print_grid_of_computer

    assert_equal 'H', player.player_choice('D2')
    assert_equal 'H', player.player_choice('D3')
    assert_equal 'H', player.player_choice('D4')
    assert_equal 'H', player.player_choice('A3')
    assert_equal 'H', player.player_choice('A2')

  end

  def test_coordinates_are_replaced_hit_or_miss_if_guessed
    cp = ComputerPlayer.new
    player = Player.new

    cp.place_ship1
    cp.place_ship2

    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])

    cp_input = ['A3']
    player_input = ['C3']
    player.computer_guess(cp_input)
    cp.player_guess(player_input)

    player.printable_enemy_grid
    cp.printable_enemy_grid
    player.print_grid_of_player
  end

  def test_can_sink
    cp = ComputerPlayer.new
    player = Player.new

    cp.place_ship1
    cp.place_ship2

    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])

    cp_input = ['A3']
    player_input = ['B3']
    cp_input = ['D3']
    player_input = ['C3']
    cp_input = ['A2']
    player_input = ['D3']
    player.computer_guess(cp_input)
    cp.player_guess(player_input)

    player.printable_enemy_grid
    cp.printable_enemy_grid
    player.print_grid_of_player

  end

end
