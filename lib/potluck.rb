require './lib/dish'

class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    menu = {:appetizers => get_all_from_category(:appetizer),
    :entres => get_all_from_category(:entre),
    :desserts => get_all_from_category(:dessert)}
  end

  def ratio(category)
    100 * (get_all_from_category(category).length.to_f / @dishes.length.to_f)
  end
end
