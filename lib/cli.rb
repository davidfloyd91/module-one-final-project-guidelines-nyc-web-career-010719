#
# puts "Hello! Welcome to the Harvard Museum of Art API Querier"
#
# puts "Enter a keyword to search for: "
#
# input = gets.chomp
#
# print_search_results
#
# puts "Choose from 0-9 to get more information "
# input2 = gets.chomp.to_i
#
# puts_image_info(input2)
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
