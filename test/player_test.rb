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
    #test hp can choose 2 coordinates to place first ship
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
    player = Player.new

    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])

    assert_equal 'H', player.player_choice('D2')
    assert_equal 'H', player.player_choice('D3')
    assert_equal 'H', player.player_choice('D4')
    assert_equal 'H', player.player_choice('A3')
    assert_equal 'H', player.player_choice('A2')

  end
end
