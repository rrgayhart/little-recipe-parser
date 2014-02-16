class LittleRecipeParser::Parse
  attr_accessor :raw_ingredient, :measurement, :quantity, :tag

  def initialize(string)
    @raw_ingredient = string
    @tag = get_tag
    @measurement = get_measurement
    @quantity = get_quantity
  end

  def persisted?
    false
  end

  def get_tag
    LittleRecipeParser::GroceryListFormatter.check_name(raw_ingredient)
  end

  def get_quantity
    qtys = raw_ingredient[0..8].split.select do |char|
      char =~ /[[:digit:]]/
    end
    joined_qty = qtys.join(' ')
    if joined_qty.include?('(')
      joined_qty = joined_qty.partition('(').first.strip
    end
    if joined_qty == ""
      return nil
    else
      joined_qty
    end
  end

  def get_measurement
    measurements = acceptable_measurements.select do |measure|
      raw_ingredient[0..20].downcase.include?(measure.downcase)
    end
    if measurements.any?
      answer = measurements.first.strip
    else
      answer = check_secondary_measurements
    end
  end

  def check_secondary_measurements
    secondary_measurements.select do |measure|
      raw_ingredient[0..20].downcase.include?(measure.downcase)
    end.first.try(:strip)
  end

  def acceptable_measurements
    ['teaspoon', 'teaspoons', ' t ', 'tsp', ' cup ', 'cups', ' pound ', 'pounds', ' tablespoon ', 
      'tablespoons', 'tbl', 'tbs', 'tbsp', 'ounce ', 'ounces', ' oz ', 'fl oz', ' pint ', 'pints', ' quart ', 'quarts',
      'gallon', 'gallons', ' ml ', 'liter', 'litre', ' l ', 'dash']
  end

  def secondary_measurements
    ['strip', 'strips', 'package', 'can ', 'cans', 'bunch ', 'bunches', 'slice', 'slices', 'cube', 'cubes']
  end

end
