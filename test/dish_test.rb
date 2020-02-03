require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish.rb'
class DishTest < Minitest::Test
  def test_it_exists
    dish = Dish.new("Salsa", :Appetizer)
    assert_instance_of Dish, dish
  end
end
