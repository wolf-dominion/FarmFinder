require 'pp'

class Cli
    attr_accessor :user, :choice

    def initialize(user)
        @user = user
        @choice = "main"
    end

    def main_menu
        puts ""
        puts "OPTIONS"
        puts ""
        puts "1. Search by farm  |   2. Search by food" 
        puts "3. List all farms  |  4. List all food"
        puts "Type a number and press enter to get started."
        puts "Type 'main' to return to the main menu , type 'control C' to quit the program."
        puts ""
        navigation
    end

    def navigation
        print "Your input: "
        input = gets.chomp
        if input == "1"
            print_farm_name_list
        elsif input == "2"
            search_by_food_intro
        elsif input == "main"
            puts "You are already in the main menu"
            # main_menu
        else
            puts "Please enter a valid command"
            main_menu
        end
    end

    def print_farm_name_list
        puts ""

        prompt = TTY::Prompt.new
        selection = prompt.select("Farm List", list_farm_names)

        #Currently working on making the below if-statements dynamic rather than hard coded. Feel free 
        # to work on it or anything you want
        if selection == list_farm_names[0]#"El Dorado"
            farm = Farm.all.find_by(name: "El Dorado Farms")
            farmId = farm.id
            farmProductArray = FarmProduct.where(farm_id: farm.id)

            farmProductArray.each do |n|
                productId = n.product_id # 1
                product = Product.all.find_by(id: productId) #product instance
                productName = product.name #product name

                puts "#{productName}: #{n.quantity} "
            end

        elsif selection == "Sunspot"
            farm = Farm.find_by(name: "Sunspot")
            puts "#{farm} has: "


        elsif selection == "Raisin Roots"
           farm = Farm.find_by(name: "Raisin Roots")
           puts "#{farm} has: "


        end

    end

    def search_by_farm_input
        
        print "Your input: "
        
        input = gets.chomp
        
        puts "Farm info: "
        # farm names are listed out numerically
        # user inputs number corresponding to farm name
        # code finds the index + 1 from array of all farms
        # After farm instance is selected, display the farm's produce name (produce id) and quantity (farm produce id and then attribute)
        
        # farmName = Farm.all.(input.to_i + 1).name 
        # farmId = Farm.all.(input.to_i + 1).id
        
        # result = FarmProduct.all.select do |fp|
        #     fp.farm_id == farmId
        # end

        # result.each do |n|
        #     puts "There is: #{n}"
        # end

    end

#Lydia's portion of code   
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
            return_to_main_menu_question
        end
    end

    def return_to_main_menu_question
        puts "Would you like to return to the main menu? (Type 'yes' or 'no') "
        print "Your input: "
        input = gets.chomp
        if input == 'yes'
            main_menu
        else input == 'no'
            quit_question
        end
    end

    def quit_question
        puts "Do you want to quit the program?"
        print "Your input: "
        input = gets.chomp
        if input == 'yes'
            exit
        else input == 'no'
            main_menu
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
        all_farm_names
    end  

    def list_farm_names
        all_farm_names = Farm.all.map do |farm|
            farm.name
        end
        all_farm_names
    end 

end