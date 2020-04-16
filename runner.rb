require_relative 'config/environment'


print "Welcome to ".bold
puts "Denver FarmFinder\n".colorize(:light_blue).bold.underline
puts "Welcome! FarmFinder was built to support local food economies. Here, we help you buy directly from local farms in your area."
puts "Let's get started!".colorize(:yellow)
puts "What's your name?"
user_name = gets.chomp

#binding.pry

user = User.new(user_name)

cli = Cli.new(user)
cli.run


#app = App.new(user)
#app.search_by_food_intro


#binding.pry


