require 'pp'

class Cli
    attr_accessor :user, :run, :welcome

    def initialize(user)
        @user = user
        @run = true
        @welcome = true
    end

    def menu_question 
        puts ""    
        prompt = TTY::Prompt.new
            selection = prompt.select("Options".underline) do |menu|
            menu.choice 'Return to main menu', -> {main_menu}
            menu.choice 'Exit Denver Farm Finder', -> { exit }
            puts ""
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
       
        farm_selection(selection)
        menu_question
    end
    
    def farm_selection(selection)
        farm = Farm.all.find_by(name: selection)
        farm_id = farm.id
        farm_product_array = FarmProduct.where(farm_id: farm.id)
        if farm.website == nil
            puts "\nWebsite: website unavailable"  
        else 
            print "\nWebsite: " 
            puts"#{farm.website}".colorize(:blue)
        end
        puts "Inventory:"

        farm_product_array.each do |n|
            product_id = n.product_id # 1
            product = Product.all.find_by(id: product_id) #product instance
            product_name = product.name #product name

            puts "#{product_name}: #{n.quantity}"
        end
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
        puts ""
        food_selection(selection)
    end

    def food_selection(selection)
        food = Product.all.find_by(name: selection)
        food_id = food.id
        food_array = FarmProduct.where(product_id: food_id)

        food_array.each do |n|
            farmId = n.farm_id
            farm = Farm.all.find_by(id: farmId)
            
            if farm.website == nil
                puts "#{selection}: #{n.quantity} available at #{farm.name} | Website: not available"
            else
                print "#{selection}: #{n.quantity} available at #{farm.name} | Website: "
                print "#{farm.website}\n".colorize(:blue)
            end
        end
    end

#Option 3: Search by Food

    def search_by_food_intro
        puts "What local food item can we help you find?"
        print "Begin typing: "
        user_search = gets.chomp.capitalize()
       
        product_listing = Product.find_by(name: user_search)
        if product_listing
            food_selection(user_search)
        else
            puts "None of the farms near Denver have #{user_search} right now."
        end
    end
end