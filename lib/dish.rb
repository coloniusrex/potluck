class Dish
  attr_reader :dish_name, :category
  def initialize(dish_name, category)
    @dish_name = dish_name
    @category = category
  end
end
