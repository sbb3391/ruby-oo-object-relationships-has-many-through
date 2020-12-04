require 'pry'

class Waiter

    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name= name
        @years = years
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
    
    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max_by {|meal| meal.tip}
        best_tipped_meal.customer
    end
    

end