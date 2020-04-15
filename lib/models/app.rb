class App 
    attr_reader :user

    def initialize(user)
        @user = user
    end

    def main_menu
        
    end

    def sets_user
        #
    end
#binding.pry

    def search_by_food_intro
        puts "Hello #{user.name}! What local food item can we help you find?"
        user_search = gets.chomp.capitalize
        #Have to strip user inmput even more - ex. tomatoes = tomato
       
        product_listing = Product.find_by(name: user_search)
        if product_listing
            puts "#{user_search} is available."
            #puts "#{user_search} is available at #{product_listing.farms.name}"
        else
            puts "None of the farms near Denver have #{user_search} right now."
            choice_to_list_food
        end
    end

    def choice_to_list_food
        puts "Would you like to see a list all the food available now? (Type 'yes' or 'no')."
        input = gets.chomp.downcase

        if input == 'yes'
            list_food
        else input == 'no'
            choice_to_list_farms
        end
    end

    def choice_to_list_farms
        puts "Would you like to see all the farms in your area? (Type 'yes' or 'no')."
        input = gets.chomp.downcase

        if input == 'yes'
            list_farms
        else input == 'no'
            search_by_food_intro
            #return to main menu method
        end
    end

    def list_food
        all_food_names = Product.all.map do |food|
            food.name
        end
        puts "Here what's available in your area:"
        puts all_food_names
    end

    def list_farms
        all_farm_names = Farm.all.map do |farm|
            farm.name
        end
        puts "Here are the farms in your area:"
        puts all_farm_names
    end    
end