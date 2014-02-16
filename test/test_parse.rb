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
    assert_equal 'Extra-virgin Olive Oil', method_tag('Extra-virgin olive oil')
    assert_equal 'Pasta Sauce', method_tag('26 ounce jar marinara or pasta sauce')
    assert_equal 'Parmesan Cheese', method_tag("1/4 cup Parmesan Cheese")
    assert_equal 'Chicken Broth', method_tag("3/4 cup fat-free, less-sodium chicken broth")
    assert_equal 'tablespoon', method_measurement("2 tablespoon vegetable oil")
    assert_equal nil, method_measurement("5 hot dogs (preferably Oscar Meyer wieners), cut into 1/4” slices")
  end

  should 'it handles quantity edge cases' do
    assert_equal '1', method_quantity("1 (12 ounce) package soft tofu, drained and cut into 1/2-inch cubes")
    assert_equal '2', method_quantity('2 (6 ounce) cans tuna, drained')
  end

  should 'handle a sauce' do
    assert_equal '1', method_quantity("1 teaspoon Worcester sauce")
    assert_equal 'teaspoon', method_measurement("1 teaspoon Worcester sauce")
    assert_equal 'Worcester Sauce', method_tag("1 teaspoon Worcester sauce")
  end

  should 'handle tomato sauce' do
    assert_equal '1', method_quantity("1 teaspoon Tomato sauce")
    assert_equal 'teaspoon', method_measurement("1 teaspoon Tomato sauce")
    assert_equal 'Tomato Sauce', method_tag("1 teaspoon Tomato sauce")    
  end

  should 'handle basic vinegar' do
    assert_equal 'Vinegar', method_tag("1 teaspoon Vinegar")
  end

  should 'handle tuna steaks' do
    assert_equal '2', method_quantity("2 pounds tuna steaks, about 2 inches thick")
    assert_equal 'pounds', method_measurement("2 pounds tuna steaks, about 2 inches thick")
    assert_equal 'Tuna Steak', method_tag("2 pounds tuna steaks, about 2 inches thick")    
  end

  should 'handle strips' do
    assert_equal '6', method_quantity("6 strips (2 by 1 inch) lemon zest")
    assert_equal 'strip', method_measurement("6 strips (2 by 1 inch) lemon zest")
    assert_equal 'Lemon Zest', method_tag("6 strips (2 by 1 inch) lemon zest")    
  end

  should 'handle rice' do
    assert_equal 'White Rice', method_tag("2 cups brown or white rice")
  end

  should 'handle mixed veggies' do
    assert_equal 'Frozen Mixed Vegetables', method_tag('2 cups frozen mixed vegetables')
  end

  should 'handle chicken' do
    assert_equal 'Chicken Breast', method_tag("2 large chicken breasts, cooked and shredded")
  end

  should 'handle slices of cheese' do
    assert_equal 'Swiss Cheese', method_tag('8 slices Swiss cheese')
    assert_equal 'slice', method_measurement('8 slices Swiss cheese')
  end

  should 'handle hidden pounts' do
    assert_equal '6', method_quantity("6 green plantains, peeled and cut into 1-inch pieces (about 3 pounds)")
    assert_equal nil, method_measurement("6 green plantains, peeled and cut into 1-inch pieces (about 3 pounds)")
    assert_equal 'Plantain', method_tag("6 green plantains, peeled and cut into 1-inch pieces (about 3 pounds)")    
  end

  def method_measurement(string)
    parse = LittleRecipeParser::Parse.new(string)
    parse.get_measurement
  end

  def method_quantity(string)
    parse = LittleRecipeParser::Parse.new(string)
    parse.get_quantity
  end

  def method_tag(string)
    parse = LittleRecipeParser::Parse.new(string)
    parse.get_tag
  end

end
