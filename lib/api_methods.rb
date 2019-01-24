# ##### ARTWORK METHODS ######
#
#   def print_artwork_results(arr)
#     arr.each.with_index(0) do |data, index|
#       puts "#{index}. " + data['title'][0..100]
#       puts "\n"
#     end
#   end
#
#   def display_artwork_info(arr, i)
#     puts "Title: " + arr[i]["title"]
#     puts "Artist: " + arr[i]["people"][0]["name"]
#     puts "Image: " + arr[i]["primaryimageurl"]
#   end
#
#
#   # def get_image_artist_name(arr, i)
#   #   puts "Artist: " + arr[i]["people"][0]["name"]
#   # end
#   #
#   # def get_image_url(arr, i)
#   #   puts "Image: " + arr[i]["primaryimageurl"]
#   # end
#   #
#   # def get_image_title(arr, i)
#   #  puts "Title: " + arr[i]["title"]
#   # end
#
#   def open_image(arr, i)
#     imgurl = arr[i]["primaryimageurl"]
#     system("open -a Safari #{imgurl}")
#   end
#
# ########### ARTIST METHODS #############
#
# def print_artist_results(arr)
#   arr.each.with_index(0) do |arr, index|
#     puts "#{index}. " + arr['displayname']
#     puts "\n"
#   end
# end
#
# def display_artist_info(arr, i)
#   puts "Name: " + arr[i]["displayname"]
#   puts "Culture: " + arr[i]["culture"]
#   puts "URL: " + arr[i]["url"]
# end
#
# # def get_artist_name(arr, i)
# #   arr[i]["displayname"]
# # end
# #
# # def get_artist_culture(arr, i)
# #   arr[i]["culture"]
# # end
# #
# # def get_artist_url(arr, i)
# #   arr[i]["url"]
# # end
