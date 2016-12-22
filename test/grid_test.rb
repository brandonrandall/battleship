require 'minitest/autorun'
require './lib/grid'
require './lib/computer_player'
require 'minitest/emoji'
require 'pry'

class GridTest < Minitest::Test

  def test_board_exists
    grid = Grid.new
    assert_instance_of Class, grid.class
  end

  def test_coordinates_can_be_printed_to_screen
    skip
    grid = Grid.new
    grid.print_layout
  end



  def test_coordinates_are_replaced_hit_or_miss_if_guessed
    cp = ComputerPlayer.new
    player = Player.new

    cp.place_ship1(["D3", "D4"])
    cp.place_ship2(["A3", "B3", "C3"])

    player.place_ship1(["A3", "A2"])
    player.place_ship2(["D2", "D3", "D4"])

    cp_input = ['A1']
    player_input = ['C3']
    player.computer_guess(cp_input)
    cp.player_guess(player_input)

    cp.print_grid_of_computer
    cp.printable_enemy_grid
  end


end
