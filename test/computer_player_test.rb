require 'minitest/autorun'
require './lib/computer_player'
require 'minitest/emoji'
require 'pry'

class ComputerPlayerTest < Minitest::Test

  def test_computer_player_exists
    cp = ComputerPlayer.new
    assert_equal "Ready to get sunk chump?", cp.start_talking
  end

  def test_computer_player_has_to_make_chained_choices

  end

  

end
