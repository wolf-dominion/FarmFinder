require_relative 'config/environment'


cli = Cli.new("Hannah")
cli.run

puts "Welcome to Denver Farm Finder!"
puts "What's your name?"
user_name = gets.chomp

user = User.new(user_name)

cli = App.new(user)
cli.search_by_food_intro


#binding.pry


