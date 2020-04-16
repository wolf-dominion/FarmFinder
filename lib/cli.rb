require 'pp'

class Cli
    attr_accessor :user, :choice

    def initialize(user)
        @user = user
        @choice = "main"
    end

    def run
        while @choice != 'quit' do 
            main_menu
        end
    end

    def main_menu
        puts "___________"
        puts ""
        puts "Type the number corresponding to the action you want and press enter."
        puts "Otherwise, type 'quit' and press enter to exit program"
        puts "___________"
        puts ""
        puts "1. Search by farm"
        puts "2. Search by food" 
        #puts "3. List all farms"
        #puts "4. List all food"
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
        elsif input == "quit"
            @choice = "quit"
            run
        else
            puts "Please enter a valid command"
            navigation
        end
    end

    def print_farm_name_list
        puts ""

        prompt = TTY::Prompt.new
        selection = prompt.select("Farm List", list_farm_names)

        def farm_selection(selection)
            farm = Farm.all.find_by(name: selection)
            farmId = farm.id
            farmProductArray = FarmProduct.where(farm_id: farm.id)

            farmProductArray.each do |n|
                productId = n.product_id # 1
                product = Product.all.find_by(id: productId) #product instance
                productName = product.name #product name

                puts "#{productName}: #{n.quantity} "
            end
        end

        farm_selection(selection)
    end

#Lydia's portion of code   

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