puts "Enter a keyword to search for: "
input = gets.chomp

api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/object",
      headers: {params: {size: 10,
                         q: "title:'#{input}'", ### user input
                         sort: "title",
                         sortorder: "asc",
                         fields: "title," "primaryimageurl," "people.name",
                         apikey: ENV['API_KEY']}},
      )
ARTWORK_DATA = JSON.parse(api_result)["records"]

def print_search_results
  ARTWORK_DATA.each.with_index(0) do |data, index|
    puts "#{index}. " + data['title'][0..100]
    puts "\n"
  end
end

print_search_results

puts "Choose from 0-9 to get more information "
input2 = gets.chomp.to_i

def get_image_title(i)
 puts "Title: " + ARTWORK_DATA[i]["title"]
end

def get_image_artist_name(i)
  puts "Artist: " + ARTWORK_DATA[i]["people"][0]["name"]
end

def get_image_url(i)
  puts "Image: " + ARTWORK_DATA[i]["primaryimageurl"]
end



# binding.pry
puts get_image_title(input2)
puts get_image_artist_name(input2)
puts get_image_url(input2)

def testing_testing(i)
  imgurl = ARTWORK_DATA[i]["primaryimageurl"]
  system("open -a Safari #{imgurl}")
end

testing_testing(input2)


# binding.pry

"bye!"
#################let me try with artist
#
#
# art_input = "da vinci"  #### this will be user input
#
# api_result2 = RestClient::Request.execute(method: :get,
#           url: "https://api.harvardartmuseums.org/person",
#       headers: {params: {size: 10,
#                          q: "displayname:'#{art_input}'", ### user input
#                          sort: "displayname",
#                          sortorder: "asc",
#                          # fields: "title," "primaryimageurl," "people.name",
#                          apikey: ENV['API_KEY']}},
#       )
# ARTIST_DATA = JSON.parse(api_result2)["records"]
#


#### INT WILL BE USER NUMBER CHOICE FROM LIST



# def get_artist_name(choice_number)
#   ARTIST_DATA[choice_number]["people"][0]["name"]
# end
#
# def umget_image_url(choice_number)
#   ARTIST_DATA[choice_number]["primaryimageurl"]
# end
#
# def get_image_title(choice_number)
#   ARTIST_DATA[choice_number]["title"]
# end
#



#
#
# def get_character_movies_from_api(character)
#   #make the web request
#
#   # uri = URI('http://www.swapi.co/api/people/')
#   all_characters = RestClient.get('http://www.swapi.co/api/people/')
#   character_hash = JSON.parse(all_characters)
#   character_data = character_hash["results"].find { |data| data["name"] == character }
#   film_urls = character_data["films"]
#   film_data = film_urls.collect { |data| JSON.parse(RestClient.get(data)) }
#   film_data
#   # iterate over the character hash to find the collection of `films` for the given
#   #   `character`
#   # collect those film API urls, make a web request to each URL to get the info
#   #  for that film
#   # return value of this method should be collection of info about each film.
#   #  i.e. an array of hashes in which each hash reps a given film
#   # this collection will be the argument given to `parse_character_movies`
#   #  and that method will do some nice presentation stuff: puts out a list
#   #  of movies by title. play around with puts out other info about a given film.
# end
#
# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
#   # films_hash = get_character_movies_from_api("Luke Skywalker")
#   films_hash.each.with_index(1) do |data, index|
#     puts "#{index} " + data['title']
#   end
# end
#
# def show_character_movies(character)
#   films_hash = get_character_movies_from_api(character)
#   parse_character_movies(films_hash)
#   # binding.pry
# end
#
#
#
#
# def find_character_hash(response_hash, character_name)
#   response_hash["results"].find do |character|
#     character["name"].downcase == character_name
#   end
# end
#
# def find_film_hash(response_hash, film_title)
#   response_hash["results"].find do |film|
#     film["title"].downcase == film_title
#   end
# end
#
# def get_film_info(film_urls)
#   film_urls.map do |film|
#     film_string = RestClient.get(film)
#     JSON.parse(film_string)
#   end
# end
#
# def get_character_info(character_urls)
#   character_urls.map do |character|
#     character_string = RestClient.get(character)
#     JSON.parse(character_string)
#   end
# end
#
# def get_character_movies_from_api(character_name)
#   #make the web request
#   response_string = RestClient.get('http://www.swapi.co/api/people/')
#   response_hash = JSON.parse(response_string)
#   character_hash = find_character_hash(response_hash, character_name)
#   get_film_info(character_hash["films"])
# end


#
# binding.pry
#
# search_by_object("blue")
