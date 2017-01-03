require 'minitest/autorun'
require 'minitest/emoji'
require './lib/scrubber'
require 'pry'

class ScrubberTest < Minitest::Test

  def test_scrubber_upcases_entries
    input = "a1"
    scrubber = Scrubber.caps(input)
    assert_equal "A1", scrubber
  end

  def test_first_ship_is_valid_with_correct_format_of_coordinates
    input = "a1 b1"
    scrubber = Scrubber.first_ship_validate(input)
    assert_equal "A1 B1", scrubber
  end

  def test_first_ship_input_accepts_only_two_entries
    input = "a1 a2 a3"
    scrubber = Scrubber.first_ship_validate(input)
    refute scrubber
  end

  def test_second_ship_input_accepts_only_three_entries
    input = "a1 a2 a3"
    scrubber = Scrubber.second_ship_validate(input)
    assert_equal "A1 A2 A3", scrubber
  end

end
