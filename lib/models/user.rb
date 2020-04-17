class User
    attr_reader :name

    def initialize()
        @name
        info
    end

    def info
        puts "\nWelcome to ".underline.bold + "Denver FarmFinder!".colorize(:light_green).underline.bold
        puts "FarmFinder was built to support local food economies. We help you buy directly from local farms in your area."
        puts "Let's get started!".colorize(:yellow) + " What's your name?"
        user_name = gets.chomp.capitalize()
        @name = user_name
    end
    
end