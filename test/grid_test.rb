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
    grid = Grid.new
    grid.print_layout
  end

  def test_coordinates_can_print_to_screen
  end

  def test_coordinates_are_replaced_by_spacers
  end

  def test_cp_choices_can_print_to_screen
    skip
    cp = ComputerPlayer.new
    cp.make_choices("A1", "B1")
  end

end


  # def test_grid_has_four_rows_and_four_columns
  #   grid = Grid.new
  #   assert_equal [["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"]], grid.grid_layout
  # end
  #
  # def test_grid_has_ID_for_rows_and_coloumns
  #   grid = Grid.new
  #   assert_equal [["A", "B", "C", "D"],
  #                 [1, 2, 3, 4],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"]], grid.id_creator
  # end
  #
  # def test_grid_can_generate_coordinates
  #   skip
  #   grid = Grid.new
  #   cp = ComputerPlayer.new
  #   cp.makes_choices("A","1","B","1")
  #   assert_equal [A1, B1], grid.map_coordinates
  # end
  #
  # def test_grid_can_replace_space_with_something
  #   skip
  #   grid = Grid.new
  #   cp = ComputerPlayer.new
  #   cp.makes_choices("A","1","B","1")
  #   assert_equal [A1, B1], grid.map_coordinates
  #   assert_equal [["CP", "CP", "-", "-"],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"],
  #                 ["-", "-", "-", "-"]], grid.id_creator
  # end
  #
  # def test_grid_is_a_hash
  #   grid = Grid.new
  #   assert_equal "", grid.grid_is_laid_out
  # end
