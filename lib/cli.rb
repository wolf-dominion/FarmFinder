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
        selection = prompt.select("Main Menu".underline) do |menu|
            menu.choice 'Choose a local farm', -> { print_farm_name_list }
            menu.choice 'Choose from available food', -> { choose_from_food }
            menu.choice 'Search by food', -> { search_by_food_intro }
            menu.choice 'Exit Denver Farm Finder', -> { exit }
        end
    end

#Option 1: Choose a local farm

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

#Option 2: Choose a local food


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

#Option 3: Search by Food

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
        prompt = TTY::Prompt.new
        answer = prompt.yes?('Return to main menu?')
            if answer == true
                main_menu
            else
                exit
            end
    end
end