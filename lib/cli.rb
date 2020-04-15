class Cli
    attr_accessor :user, :choice

    def initialize(user)
        @user = user
        @choice = "main"
    end

    def main_menu
        puts ""
        puts "1. Search by farm"
        puts "2. Search by food" 
        puts ""
        puts "At any time type and press enter: "
        puts "Main to return to main menu"
        puts "Quit to quit program"
        puts ""
    end

    def get_choice_input
        print "Your input: " 
        @choice = gets.chomp
    end

    def actions
        if @choice == '1' 
            puts ""
            puts "Farm results:"
            run
        elsif @choice == '2'
            puts ""
            puts "Choice is 2 is being implemented"
            run
        elsif @choice == "main"
            puts ""
            run
        elsif @choice == "quit"
            puts ""
            run
        else
            @choice = "try_again"
            run
        end
    end

    def search_by_farm
        puts ""
        print_farm_name_list
        puts ""
        puts "Type farm name or number to view more information."
        puts "Otherwise, type 'main' or 'quit'"
    end

    def print_farm_name_list
        Farm.all.each do |farm|
            puts "#{Farm.all.index(farm) + 1}. #{farm.name}"
        end
    end

    def search_by_farm_input
        #print "Your input: "
        #farm_name = gets.chomp
    end

    def run
        while @choice != "quit" do
            if @choice == "main"
                main_menu
                get_choice_input
                actions
            
            elsif @choice == '1'
                search_by_farm
                get_choice_input
                actions
            
            elsif @choice == '2'
                puts ""
                get_choice_input
                actions

            elsif @choice == 'try_again'
                puts "Please enter a valid command"
                get_choice_input
                actions
            end
        end
        if @choice == 'quit'
            puts "Program ended"
            exit
        end
    end
end