require "pry"
class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(type)
    dish_by_category = []
    dishes.each do |dish|
      if dish.category == type
        dish_by_category << dish
      end
    end
    dish_by_category
  end

  def menu
    menu_hash = {}
    dishes.each do |dish|
      menu_hash[dish.category] = []
    end
    menu_hash.keys.sort.each do |category|
      dishes.each do |dish|
        if dish.category == category
          menu_hash[category] << dish.name
        end
      end
      menu_hash[category] = menu_hash[category].sort
    end
    menu_hash
  end

  def ratio(category)
    total_dishes = dishes.count
    cat_dishes = 0
    dishes.each do |dish|
      if dish.category == category
        cat_dishes += 1
      end
    end
    ((cat_dishes.to_f / total_dishes.to_f) * 100)
  end
end
