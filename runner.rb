require_relative 'config/environment'

puts "Welcome to Denver Farm Finder!"
puts "What's your name?"
user_name = gets.chomp
#binding.pry

user = User.new(user_name)

cli = Cli.new(user)
cli.run


#app = App.new(user)
#app.search_by_food_intro


#binding.pry


