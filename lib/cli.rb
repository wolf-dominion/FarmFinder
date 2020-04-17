class Cli
    attr_accessor :user, :welcome

    def initialize(user)
        @user = user
        @welcome = true
    end

    def menu_question   
        prompt = TTY::Prompt.new
            selection = prompt.select("\nOptions".underline) do |menu|
            menu.choice 'Return to main menu', -> {main_menu}
            menu.choice 'Exit Denver Farm Finder', -> { puts "Good bye #{@user.name}!\n"}
        end
    end

    def welcome_message
        puts "\nWelcome #{user.name}! How'd you like to search for local food?".colorize(:yellow)
        @welcome = false
        main_menu
    end

    def main_menu
        if @welcome == true 
            welcome_message
        end
        prompt = TTY::Prompt.new
        selection = prompt.select("\nMain Menu".underline) do |menu|
            menu.choice 'Choose a local farm', -> { print_farm_name_list }
            menu.choice 'Choose from available food', -> { choose_from_food }
            menu.choice 'Search by food', -> { search_by_food_intro }
            menu.choice 'Exit Denver Farm Finder', -> { exit }
        end
    end

#Option 1: Choose a local farm

    def print_farm_name_list
        prompt = TTY::Prompt.new
        selection = prompt.select("\nFarm List", list_farm_names)
        farm_selection(selection)
        menu_question
    end
    
    def farm_selection(selection)
        farm = Farm.all.find_by(name: selection)
        if farm.website == nil
            puts "\nWebsite: website unavailable".colorize(:yellow)
        else 
            puts "\nWebsite: " + "#{farm.website}".colorize(:blue)
        end
        puts "Inventory:".colorize(:yellow)

        farm.farm_products.each do |n|
            puts "#{n.product.name}: #{n.quantity}".colorize(:yellow)
        end
    end

    def list_farm_names
        Farm.all.map {|farm| farm.name}
    end
      
    def list_food_names
        Product.all.map {|product| product.name}
    end

#Option 2: Choose a local food


    def choose_from_food
        prompt = TTY::Prompt.new
        selection = prompt.select("\nFood List: ", list_food_names)
        food_selection(selection)
        menu_question
    end

    def food_selection(selection)
        food = Product.all.find_by(name: selection)
        food.farm_products.each do |n|
            if n.farm.website == nil
                puts "#{n.quantity} available at #{n.farm.name} | Website: not available".colorize(:yellow)
            else
                puts "#{n.quantity} available at #{n.farm.name} | Website: ".colorize(:yellow) + "#{n.farm.website}".colorize(:blue)
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
            menu_question
        else
            puts "None of the farms near Denver have #{user_search} right now.".colorize(:yellow)
            menu_question
        end
    end
end