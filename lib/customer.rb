class Customer

    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name= name
        @age = age
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
  
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end 

    def meals
        #returns an array of all meals that relate to this customer instance
        Meal.all.select { |meal| meal.customer == self }
        
    end

    def waiters
        #looks through the meals return and o
        meals.map {|meal| meal.waiter }
    end
end