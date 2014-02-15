require 'helper'

class ParseTest < Test::Unit::TestCase

  should 'return formatted answer' do
    parse = LittleRecipeParser::Parse.new('1 pound of chicken')
    assert_equal '1', parse.quantity
    assert_equal 'pound', parse.measurement
    assert_equal 'Chicken', parse.tag
  end

  should 'it handles normal cases' do
    assert_equal 'pound', method_measurement('1 pound chicken')
    assert_equal 'cups', method_measurement("3 cups bean sprouts")
  end

  should 'it handles edge cases' do
    assert_equal 'strip', method_measurement('8 strips thick-cut bacon')
    assert_equal 'package', method_measurement('1 (12 ounce) package soft tofu, drained and cut into 1/2-inch cubes')
    assert_equal 'cans', method_measurement('2 (6 ounce) cans tuna, drained')
    assert_equal 'bunch', method_measurement('1 bunch watercress, chopped')
  end

  should 'it handles quantity edge cases' do
    assert_equal '1', method_quantity("1 (12 ounce) package soft tofu, drained and cut into 1/2-inch cubes")
    assert_equal '2', method_quantity('2 (6 ounce) cans tuna, drained')
  end

  def method_measurement(string)
    parse = LittleRecipeParser::Parse.new(string)
    parse.get_measurement
  end

  def method_quantity(string)
    parse = LittleRecipeParser::Parse.new(string)
    parse.get_quantity
  end

end
