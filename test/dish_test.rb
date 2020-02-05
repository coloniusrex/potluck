require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish.rb'
class DishTest < Minitest::Test
  def test_it_exists
    dish = Dish.new("Salsa", :Appetizer)
    assert_instance_of Dish, dish
  end

  def test_it_has_dish_name
    dish = Dish.new("Salsa", :Appetizer)
    assert_equal "Salsa", dish.dish_name
  end

  def test_it_has_category
    dish = Dish.new("Salsa", :Appetizer)
    assert_equal :Appetizer, dish.category
  end
end
