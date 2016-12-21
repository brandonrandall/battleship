require 'minitest/autorun'
require './lib/battlship'
require 'minitest/emoji'
require 'pry'

class BattleshipTest < Minitest::Test

  def test_battleship_receives_input
    battleship = Battleship.new
    assert_equal String, battleship
  end


end
