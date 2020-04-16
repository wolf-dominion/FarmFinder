require 'pp'

class Cli
    attr_accessor :user, :run, :welcome

    def initialize(user)
        @user = user
        @run = true
        @welcome = true
    end

    def run
        while @run = true do 
            main_menu
        end
    end

    def welcome_message
        puts "\nWelcome #{user.name.capitalize}! How'd you like to search for local food?" #use colorize gem to make bold!
        @welcome = false
        main_menu
    end

    def main_menu
        if @welcome == true 
            welcome_message
        end
        puts ""
        prompt = TTY::Prompt.new
        selection = prompt.select("Main Menu") do |menu|
            menu.choice 'Choose a local farm', -> { print_farm_name_list }
            menu.choice 'Choose from available food', -> { choose_from_food }
            menu.choice 'Search by food', -> { search_by_food_intro }
            menu.choice 'Exit Denver Farm Finder', -> { exit }
        end
    end

    def print_farm_name_list
        puts ""

        prompt = TTY::Prompt.new
        selection = prompt.select("Farm List", list_farm_names)

        def farm_selection(selection)
            farm = Farm.all.find_by(name: selection)
            farm_id = farm.id
            farm_product_array = FarmProduct.where(farm_id: farm.id)

            farm_product_array.each do |n|
                product_id = n.product_id # 1
                product = Product.all.find_by(id: product_id) #product instance
                product_name = product.name #product name

                puts "#{n.quantity} #{product_name}"
            end
        end
        puts ""
        puts "#{selection} Inventory"
        farm_selection(selection)
    end

    def list_farm_names
        all_farm_names = Farm.all.map do |farm|
            farm.name
        end
        all_farm_names
    end

    def list_food_names
        all_food_names = Product.all.map do |product|
            product.name
        end
        all_food_names
    end

#Lydia's portion of code   

    def choose_from_food
        puts ""

        prompt = TTY::Prompt.new
        selection = prompt.select("Food List", list_food_names)

        def food_selection(selection)
            food = Product.all.find_by(name: selection)
            food_id = food.id
            food_array = FarmProduct.where(product_id: food_id)

            food_array.each do |n|
                farmId = n.farm_id
                farm = Farm.all.find_by(id: farmId)
                puts "#{n.quantity} #{selection} are available at #{farm.name}."
            end
        end

        puts ""
        food_selection(selection)

        # #all_food_objects = Product.all
        # all_food_names = Product.all.map do |food|
        #     food.name
        # end

        # prompt = TTY::Prompt.new
        # selection = prompt.select("What food are you looking for?", all_food_names)
        # all_farm_products = FarmProduct.where(name: selection)
        # #binding.pry
        # farm_name = all_farm_products.farms.name
        # # all_farm_products.map do |farmproduct|
        # #     farmproduct.
        # puts "#{selection} are available at #{farm_name}."
        
    end

    def search_by_food_intro
        puts "What local food item can we help you find?"
        user_search = gets.chomp.capitalize
       
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
        # puts "Would you like to return to the main menu? (Type 'yes' or 'no') "
        # print "Your input: "
        # input = gets.chomp
        # if input == 'yes'
        #     main_menu
        # else input == 'no'
        #     quit_question
        # end
        prompt = TTY::Prompt.new
        answer = prompt.yes?('Return to main menu?')
            if answer == true
                new_main_menu
            else
                exit
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

    


#THIS IS THE METHOD CEMETARY (R.I.P.)
 # def main_menu
    #     puts "___________"
    #     puts ""
    #     puts "Type the number corresponding to the action you want and press enter."
    #     puts "Otherwise, type 'Quit' and press enter to exit program"
    #     puts "___________"
    #     puts ""
    #     puts "1. Search by farm"
    #     puts "2. Search by food" 
    #     #puts "3. List all farms"
    #     #puts "4. List all food"
    #     puts ""
    #     navigation
    # end

    # def navigation
    #     print "Your input: "
    #     input = gets.chomp
    #     if input == "1"
    #         print_farm_name_list
    #     elsif input == "2"
    #         search_by_food_intro
    #     elsif input == "quit"
    #         @choice = "quit"
    #         run
    #     else
    #         puts "Please enter a valid command"
    #         navigation
    #     end
    # end

end