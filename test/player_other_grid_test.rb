require './lib/computer_player'
require './lib/player_other_grid'
require './lib/player'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class PlayerOtherGridTest < Minitest::Test

  def test_can_display_enemy_screen
    player = Player.new
    grid = Grid.new
    computer_player = ComputerPlayer.new
    other_grid = PlayerOtherGrid.new
    enemy_grid = grid.print_layout

    computer_player.place_ship1(["D3", "D4"])
    computer_player.place_ship2(["A3", "B3", "C3"])

    assert_equal 'C', computer_player.computer_choice('D3')
    assert_equal 'C', computer_player.computer_choice('D4')
    assert_equal 'C', computer_player.computer_choice('A3')
    assert_equal 'C', computer_player.computer_choice('B3')
    assert_equal 'C', computer_player.computer_choice('C3')
  end
end
