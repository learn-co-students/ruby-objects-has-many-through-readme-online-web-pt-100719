class Customer
  attr_reader :name, :age
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter_obj, total, tip)
    Meal.new(waiter_obj, self, total, tip)
  end
  
  def meals
    Meal.all.select{|meal| meal.customer == self}
  end
  
  def waiters
    my_waiters = []
    self.meals.each{|meal| my_waiters << meal.waiter}
    my_waiters
  end
  
end