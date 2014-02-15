require 'helper'

class GroceryListFormatterTest < Test::Unit::TestCase

  should "it handles edge cases" do
    assert_equal "Corn", check_name('1 cup of corn')
    assert_equal "Black Peppercorn", check_name('8 black peppercorns')
    assert_equal "Red Wine Vinegar", check_name("1 cup red wine vinegar")
    assert_equal "Cloves", check_name("1 tablespoon of cloves")
    assert_equal "Salt and Pepper", check_name("salt and pepper")
    assert_equal "Olive Oil", check_name("2 tablespoons olive oil")
    assert_equal "Pearl Onion", check_name("8 ounces white or yellow pearl onions")
    assert_equal "Pork Loin", check_name("4 boneless pork loin cutlets, 6-8 ounces each")
    assert_equal "Agave Syrup", check_name('1 1/2 tsp agave syrup')
    assert_equal "Fresh Ginger", check_name('1-inch (3cm) piece fresh ginger, peeled and minced')
    assert_equal "Powdered Ginger", check_name('1-inch tsp powdered ginger')
    assert_equal "Tofu", check_name("1 (12 ounce) package soft tofu, drained and cut into 1/2-inch cubes")
  end

  should "it handles odd pluralization" do
    assert_equal "Pancetta", check_name("1 cup pancetta, finely diced")
    assert_equal "Bay Leaves", check_name('2 bay leaves')
  end

  should "it handles juice" do
    assert_equal "Lime", check_name("juice from 2 limes")
  end

  should "it handles veggies" do
    assert_equal "Bean Sprouts", check_name("3 cups bean sprouts")
    assert_equal "Watercress", check_name('1 bunch watercress, chopped')
    assert_equal "Tomato", check_name('2 tomatoes, cubed')
    assert_equal "Radish", check_name('1/4 cup Japanese pickled radish (optional)')
  end

  should "it handles meat" do
    assert_equal "Tuna", check_name('2 (6 ounce) cans tuna, drained')
  end

  def check_name(string)
    LittleRecipeParser::GroceryListFormatter.check_name(string)
  end

end
