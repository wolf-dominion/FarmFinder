require_relative 'config/environment'

# Cli.new.start_game
def main_menu
    puts "Welcome to Denver Farm Finder!"
    puts "What's your name?"
    user_name = gets.chomp
end

binding.pry

def search_by_food_intro
    puts "Hello #{user_name}, What local food item can we help you find?"
    user_food_input = gets.chomp.downcase
    Products.all.find_all do |product|
        product.name == user_food_input
    end
end
    
#puts "Hi, #{user_name}"
#Examples Selecting things w/ ActiveRecord
#Farm.find_by(name: "Sunspot")
#f = Farm.first
#f.products




binding.pry


