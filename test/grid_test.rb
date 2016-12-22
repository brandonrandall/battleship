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

  # def test_coordinates_start_at_
  #   cp_input = ['A1']
  #   player_input = ['C1']
  #   my_grid = Grid.new
  #   my_grid.replace_with_hit_or_miss(cp_input, player_input)
  #
  #   assert_equal 'X', my_grid.grid['A1']
  # end


  def test_coordinates_are_replaced_hit_or_miss_if_guessed
    # skip

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
    # my_grid = Grid.new
    # my_grid.replace_with_hit_or_miss(cp_input, player_input)

    player.print_grid_of_player
    cp.print_grid_of_computer
    player.printable_enemy_grid
    cp.printable_enemy_grid



    # assert_equal 'M', my_grid.grid['A1']
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
