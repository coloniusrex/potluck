require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'
class PotluckTest < Minitest::Test
  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @bean_dip = Dish.new("Bean Dip", :appetizer)
  end
  def test_it_exists
    assert_instance_of Potluck, @potluck
  end

  def test_it_has_date
    assert_equal "7-13-18", @potluck.date
  end

  def test_dishes_array_begins_empty
    assert_equal [], @potluck.dishes
  end

  def test_it_can_add_dishes
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@cocktail_meatballs)
    expected = [@couscous_salad, @cocktail_meatballs]
    assert_equal expected, @potluck.dishes
    assert_equal 2, @potluck.dishes.length
  end

  def test_get_all_dishes_by_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    expected = [@couscous_salad, @summer_pizza]
    assert_equal expected, @potluck.get_all_from_category(:appetizer)
    assert_equal @couscous_salad,
    @potluck.get_all_from_category(:appetizer).first
  end

  def test_it_can_produce_a_menu
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    expected = {:appetizers => @potluck.get_all_from_category(:appetizer),
                :entres => @potluck.get_all_from_category(:entre),
                :desserts => @potluck.get_all_from_category(:dessert)}
    assert_equal expected , @potluck.menu
  end

  def test_it_can_produce_ratio_by_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    @potluck.add_dish(@bean_dip)
    assert_equal 50.0, @potluck.ratio(:appetizer)
  end
end
