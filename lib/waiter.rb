class Waiter
  attr_accessor :name, :experience
  @@all = []
  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    tipper = meals.max do |meal_1, meal_2|
      meal_1.tip <=> meal_2.tip
    end

    tipper.customer
  end
end
