class BarTab

  attr_reader :name, :till

  def initialize( till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def drinks_count()
    return @drinks.count()
  end

  def food_count()
    return @food.count()
  end

  def increase_till(item)
    @till += item.price()
  end

  def sell(drink)
    @drinks.delete(drink)
  end
  def sell_food(food)
   @food.delete(food)
   increase_till(food)
  end

  def sell_to_customer(drink,age,drunkness)
      if age >= 21 && drunkness < 35
        if @drinks.include? drink
          sell(drink)
          increase_till(drink)
          return true
        end
      else
        return false
      end
    #   def sell_food_to_customer()
    # end

  end
end
