class User
    attr_reader :name

    def initialize()
        @name
        info
    end

    def info
        print "\nWelcome to ".bold
        puts "Denver FarmFinder\n".colorize(:light_green).bold
        puts "Welcome! FarmFinder was built to support local food economies. Here, we help you buy directly from local farms in your area."
        puts "Let's get started!".colorize(:yellow)
        puts "What's your name?"
        user_name = gets.chomp.capitalize()
        @name = user_name
    end
    
end