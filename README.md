# Little Recipe Parser

### A gem for parsing recipes

--------

## Usage

### gem install 'little-recipe-parser'

```ruby
result = LittleRecipeParser::Parse.new('1 pound of tomatoes')
print result.quantity
  #=> '1'
print result.measurement
  #=> 'pound'
print result.tag
  #=> "Tomato"
```

Visit the website at: 

[Live demo](http://thelittleparser.herokuapp.com/)


== Copyright

Copyright (c) 2014 Meeka. See LICENSE.txt for
further details.

