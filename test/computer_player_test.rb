# test helper
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
    #test cp can choose 2 coordinates to place first ship
    computer_player = ComputerPlayer.new
    computer_player.place_coordinate(["D3"])
    assert_equal 'C', computer_player.computer_choice('D3')
  end

  def test_computer_places_a_ship
    skip
    #test cp can choose 2 coordinates to place first ship
    computer_player = ComputerPlayer.new
    computer_player.place_coordinate(["D3", "D4"])
    assert_equal 'C', computer_player.computer_choice('D3')
    assert_equal 'C', computer_player.computer_choice('D4')
  end

  def test_computer_player_has_to_make_chained_choices
    # skip
    computer_player = ComputerPlayer.new

    computer_player.place_ship1(["D3", "D4"])
    # computer_player.place_ship2(["A3", "B3", "C3"])

    assert_equal 'C', computer_player.computer_choice('D3')
    assert_equal 'C', computer_player.computer_choice('D4')
    assert_equal 'C', computer_player.computer_choice('A3')
    assert_equal 'C', computer_player.computer_choice('B3')
    assert_equal 'C', computer_player.computer_choice('C3')

  end



end
