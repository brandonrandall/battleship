require 'minitest/autorun'
require './lib/computer_board'
require 'minitest/emoji'
require 'pry'

class ComputerBoardTest < Minitest::Test

  def test_computer_player_prints_computer_board
    skip
    cb = ComputerBoard.new
    binding.pry
    cp = ComputerPlayer.new(cb)
    assert_instance_of String, cp.cb.class
  end

  def test_board_has_a_grid
    cb = ComputerBoard.new
    assert_equal ["A1","B1","C1","D1",
                  "A2","B2","C2","D2",
                  "A3","B3","C3","D3",
                  "A4","B4","C4","D4"], cb.grid
  end

  def test_cb_has_four_rows_and_four_columns
    cb = ComputerBoard.new
    assert_equal , cb.rows
    assert_equal , cb.columns 

  end

end
