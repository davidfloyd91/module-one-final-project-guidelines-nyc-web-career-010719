require_relative './api_methods'

puts "Hello! Welcome to the Harvard Museum of Art API Querier"

puts "Enter a keyword to search for: "

input = gets.chomp

artwork_api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/object",
      headers: {params: {size: 10,
                         q: "title:'#{input}'", ### user input
                         sort: "title",
                         sortorder: "asc",
                         fields: "title," "primaryimageurl," "people.name",
                         apikey: ENV['API_KEY']}},
      )
artwork_array = JSON.parse(artwork_api_result)["records"]

print_artwork_results(artwork_array)

puts "Choose from 0-9 to get more information "
input2 = gets.chomp.to_i

puts get_image_title(artwork_array, input2)
puts get_image_artist_name(artwork_array, input2)
puts get_image_url(artwork_array, input2)

puts "Do you want to open the image?"

open_image(artwork_array, input2)

puts "Search by artist name. "
artist_input = gets.chomp

artist_api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 10,
                         q: "displayname:'#{artist_input}'", ### user input
                         sort: "displayname",
                         sortorder: "asc",
                         fields: "displayname," "culture," "url",
                         apikey: ENV['API_KEY']}},
      )
artist_array = JSON.parse(artist_api_result)["records"]

print_artist_results(artist_array)

puts "Choose 0-9 to get more information."
artist_input2 = gets.chomp.to_i


puts get_artist_name(artist_array, artist_input2)
puts get_artist_culture(artist_array, artist_input2)
puts get_artist_url(artist_array, artist_input2)

puts "bye!"

#
#
# def help
#   help = <<-HELP
# I can accept the following commands:
# - help : displays this help message
# - search : displays a list of songs you can play
# - menu : lets you see saved artworks and artists
# - exit : exits this program
# HELP
#
#   puts help
# end
#
# # def list(songs)
# #   songs.each_with_index do |song, i|
# #     puts "#{i+1}. #{song}"
# #   end
# # end
# #
# # def play(songs)
# #   puts "Please enter a song name or number:"
# #   song_to_play = gets.chomp
# #   if (1..9).to_a.include?(song_to_play.to_i)
# #     puts "Playing #{songs[song_to_play.to_i - 1]}"
# #   elsif songs.include?(song_to_play)
# #     puts "Playing #{song_to_play}"
# #   else
# #     puts "Invalid input, please try again"
# #   end
# # end
#
# def exit_api
#   puts "Bye!"
# end
#
# def run(interface)
#   # help
#
#   input = ""
#   while search
#     puts "Please enter a command:"
#     input = gets.downcase.strip
#     case input
#     when 'list'
#       list(songs)
#     when 'play'
#       list(songs)
#       play(songs)
#     when 'help'
#       help
#     when 'exit'
#       api
#       break
#     else
#       help
#     end
#   end
# end
