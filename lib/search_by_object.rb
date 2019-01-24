############ SEARCHING THROUGH ARTWORKS ######

puts "Enter a keyword to search for: "
input = gets.chomp
artwork_array = []

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


##### METHODS ######

def print_artwork_results(arr)
  arr.each.with_index(0) do |data, index|
    puts "#{index}. " + data['title'][0..100]
    puts "\n"
  end
end

print_artwork_results(artwork_array)

puts "Choose from 0-9 to get more information " ###CLI
 input2 = gets.chomp.to_i                       ###CLI

def get_image_artist_name(arr, i)
  puts "Artist: " + arr[i]["people"][0]["name"]
end

def get_image_url(arr, i)
  puts "Image: " + arr[i]["primaryimageurl"]
end

def get_image_title(arr, i)
 puts "Title: " + arr[i]["title"]
end

# binding.pry
puts get_image_title(artwork_array, input2)
puts get_image_artist_name(artwork_array, input2)
puts get_image_url(artwork_array, input2)

puts "Do you want to open the image?"

def open_image(arr, i)
  imgurl = arr[i]["primaryimageurl"]
  system("open -a Safari #{imgurl}")
end

open_image(artwork_array, input2)

###########SEARCH BY ARTIST#############

puts "Search by artist name"
art_input = gets.chomp  #### this will be user input

artist_api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 10,
                         q: "displayname:'#{art_input}'", ### user input
                         sort: "displayname",
                         sortorder: "asc",
                         fields: "displayname," "culture," "url",
                         apikey: ENV['API_KEY']}},
      )
artist_array = JSON.parse(artist_api_result)["records"]

def print_artist_results(arr)
  arr.each.with_index(0) do |data, index|
    puts "#{index}. " + data['displayname']
    puts "\n"
  end
end

print_search_results(artist_array)

puts "Choose from 0-9 to get more information "
 art_input2 = gets.chomp.to_i


def get_artist_name(arr, i)
  arr[i]["displayname"]
end

def get_artist_culture(arr, i)
  arr[i]["culture"]
end

def get_artist_url(arr, i)
  arr[i]["url"]
end

puts get_artist_name(artist_array, art_input2)
puts get_artist_culture(artist_array, art_input2)
puts get_artist_url(artist_array, art_input2)


puts "bye !"
# binding.pry
