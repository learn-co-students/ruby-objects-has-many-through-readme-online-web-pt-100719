class Waiter
  attr_reader :name, :years
  @@all = []
  
  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end

  def self.all
    @@all
  end
  
  def new_meal(customer_obj, total, tip)
    Meal.new(self, customer_obj, total, tip)  
  end
  
   def meals
    Meal.all.select{|meal| meal.waiter == self}
  end
  
  def best_tipper
    best_meal = self.meals.max{|meala, mealb| meala.tip <=> mealb.tip }
    best_meal.customer
  end

end