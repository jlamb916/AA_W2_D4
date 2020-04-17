
class Dog

    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(num)
        @age = num
    end

    def bark
        if @age > 3 
             @bark.upcase
        else 
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end
    
    def favorite_food?(food)
        @favorite_foods.each do |el|
            return true if el.downcase == food.downcase
        end
        false
    end

end

dog1 = Dog.new("annie", "maltese", 5, "bark", "chicken")



