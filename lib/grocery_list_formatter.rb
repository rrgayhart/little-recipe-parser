class LittleRecipeParser::GroceryListFormatter

  def self.check_name(string)
    array = normal.select do |ingredient|
      string.downcase.include?(ingredient.downcase.pluralize) ||
      string.downcase.include?(ingredient.downcase)
    end
    if array.any?
      array.first
    else
      check_secondary(string)
    end
  end

  def self.check_secondary(string)
    secondary.select do |ingredient|
      string.downcase.include?(ingredient.downcase.pluralize) ||
      string.downcase.include?(ingredient.downcase)
    end.first
  end

  def self.normal
    ['Allspice', 
    'Salt and Pepper',
    'Black Peppercorn',
    'Black Pepper',
    'Arrowroot starch',
    'Basil',
    'Bay Leaves',
    'Chili Powder',
    'Cinnamon',
    'Garlic Cloves',
    'Red Wine Vinegar',
    'Coriander',
    'Cream of tartar',
    'Cumin',
    'Curry',
    'Dill',
    'Fennel',
    'Five-spice powder',
    'Garlic powder',
    'Fresh Ginger',
    'Powdered Ginger',
    'Marjoram',
    'Mint',
    'Mustard',
    'Nutmeg',
    'Pearl Onion',
    'Red Onion',
    'Sweet Onion',
    'Agave Syrup',
    'Maple Syrup',
    'Oregano',
    'Paprika',
    'cayenne',
    'Peppercorns',
    'Poppy seeds',
    'Rosemary',
    'Sage',
    'Sesame seeds',
    'Tarragon',
    'Thyme',
    'Turmeric',
    'Vanilla',
    'Baking Powder',
    'Baking Soda',
    'Brown Sugar',
    'Brownie Mix',
    'Cake Mix',
    'Cocoa',
    'Cornstarch',
    'Flour',
    'Sugar',
    'Vanilla Extract',
    'Bread Crumbs',
    'Biscuits',
    'Bread',
    'Buns',
    'Rolls',
    'Soup',
    'Canned Tuna',
    'BBQ Sauce',
    'Cooking Spray',
    'Honey',
    'Horseradish',
    'Hot sauce',
    'Jelly',
    'Ketchup',
    'Mayonnaise',
    'Mustard',
    'Peanut Butter',
    'Salad Dressing',
    'Salsa',
    'Soy Sauce',
    'Vegetable Oil',
    'Worcestershire',
    'Dairy',
    'Butter',
    'Parmesan Cheese',
    'Cottage Cheese',
    'Swiss Cheese',
    'Cream',
    'Cream Cheese',
    'Eggs',
    'Milk',
    'Sour Cream',
    'Pancetta',
    'Yogurt',
    'Watercress',
    'Coffee',
    'French Fries',
    'Frozen Vegetables',
    'Ice Cream',
    'Pizza',
    'Pasta Sauce',
    'White Rice',
    'Brown Rice',
    'Spaghetti Sauce',
    'Meats',
    'Ground Beef',
    'Pork Loin',
    'Chicken Breast',
    'Chicken Thigh',
    'Chicken Wing',
    'Chicken Stock',
    'Chicken Broth',
    'Chicken Drumstick',
    'Chicken Leg',
    'Fish',
    'Frozen Mixed Vegetables',
    'Apple',
    'Asparagus',
    'Banana',
    'Berries',
    'Broccoli',
    'Cabbage',
    'Carrots',
    'Cauliflower',
    'Celery',
    'Corn',
    'Garlic',
    'Grapes',
    'Lemons',
    'Bacon',
    'Lettuce',
    'Lime Juice',
    'Melons',
    'Mushrooms',
    'Nectarines',
    'Onions',
    'Oranges',
    'Peaches',
    'Pears',
    'Plums',
    'Cornstarch',
    'Rice Wine Vinegar',
    'Sesame Oil',
    'Hoisin Sauce',
    'Scallion',
    'Tomato Sauce',
    'Bean Sprouts',
    'Tofu',
    'Tuna Steak',
    'Light Tuna',
    'White Tuna',
    'Cashew',
    'Walnut',
    'Almond',
    'Extra-virgin Olive Oil',
    'Radish',
    'Lemon Zest',
    'Lemon Wedge',
    'Worcester Sauce',
    'Fresh Cilantro',
    'Hot Dog',
    'American Cheese',
    'Cheddar Cheese',
    'Shallot',
    'Apricot Preserves',
    'Red-wine Vinegar',
    'Ground Pork',
    'Plantain',
    'Red Lentils',
    'Whole Milk',
    'Vegetable Bouillon',
    'Panko Breadcrumbs'
    ]
  end

  def self.secondary
    [
      'Salt ',
      'Wasabi',
      'Noodle',
      'Garlic',
      'Cloves',
      'Lentils',
      'Avocado',
      'Apricot',
      'Lime',
      'Bouillon',
      'Pepper',
      'Pork',
      'Juice',
      'Onion',
      'Syrup',
      'Ginger',
      'Beans',
      'Tomato',
      'Water',
      'Tuna',
      'Olive Oil',
      'Lemon',
      'Rice',
      'Chicken',
      'Vinegar',
      'Cheese',
      'Pasta Sauce',
      'Beef',
      'Cilantro',
      'Red Wine',
      'White Wine'
    ]
  end
end
