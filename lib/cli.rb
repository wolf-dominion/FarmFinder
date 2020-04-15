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
        puts "3. List all farms   |  4. List all food"
        puts "Type a number and press enter to get started."
        puts "Type 'main' to return to the main menu , type 'control C' to quit the program."
        puts ""
        navigation
    end

    def navigation
        print "Your input: "
        input = gets.chomp
        if input == "1"
            search_by_farm
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

    def get_choice_input
        print "Your input: " 
        @choice = gets.chomp
    end

    def actions
        if @choice == '1' 
            puts ""
            puts "Farm results:"
            
        elsif @choice == '2'
            puts ""
            puts "Choice is 2 is being implemented"
            run
        elsif @choice == "main"
            puts ""
            run
        # elsif @choice == "quit"
        #     puts ""
        #     run
        else
            @choice = "try_again"
            run
        end
    end

    # if @choice == "main" || @choice == "quit"
    #     principal_actions

    def principal_actions
        if @choice == "main"
            main_menu
        end
    end

    def search_by_farm
        print_farm_name_list
        puts ""
        puts "Type farm name or number to view more information."
        puts "Otherwise, type 'main' or 'quit'"
        search_by_farm_input
    end

    def print_farm_name_list
        puts ""
        Farm.all.each do |farm|
            puts "#{Farm.all.index(farm) + 1}. #{farm.name}"
        end
    end

    def search_by_farm_input
        print "Your input: "
        input = gets.chomp
        puts "#{input} is working."
        #print "Your input: "
        #farm_name = gets.chomp
    end

    # def run
    #     while @choice != "quit" do
    #         if @choice == "main"
    #             main_menu
    #             get_choice_input
    #             actions
            
    #         elsif @choice == '1'
    #             search_by_farm
    #             get_choice_input
    #             actions
            
    #         elsif @choice == '2'
    #             puts ""
    #             get_choice_input
    #             actions

    #         elsif @choice == 'try_again'
    #             puts "Please enter a valid command"
    #             get_choice_input
    #             actions
    #         end
    #     end
    #     if @choice == 'quit'
    #         puts "Program ended"
    #         exit
    #     end
    # end

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
    end  

end