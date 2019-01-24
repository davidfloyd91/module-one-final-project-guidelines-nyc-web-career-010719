require_relative '../config/environment'
require_all 'lib'
require_all 'models'




search_by_artist("magritte")

binding.pry

# puts "Welcome to the Harvard Museums API Querier, a very cool app that you will enjoy!"
#
# puts "What would you like to do?\n 1. Create a new user?\n 2. Sign in as existing user?"

response_one = gets.chomp

def create_or_sign_in(response_one)
  #
end
