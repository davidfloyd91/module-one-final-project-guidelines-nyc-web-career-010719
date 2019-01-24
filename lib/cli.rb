require_relative './api_methods'
require_all 'models'
require_relative '../config/environment.rb'

$user = nil

def welcome
  puts "Welcome to the Harvard Museum API Querier!"
end

def obtain
  gets.chomp
end

def get_user
  puts "Please enter your name to sign into your existing account or to create a new one."
  save_user(obtain)
end

def menu
  puts "Welcome #{$user.name}!"
  puts "Please choose from the options below:\n1. Search by artist\n2. Search by artwork\n3. Access saved artists\n4. Access saved artworks\n5. Exit"
  choice = obtain.to_i
  if choice == 1
    puts "Please enter the name of an artist."
    artist_search_choice = search_by_artist(obtain)
    puts "Please choose an artist using corresponding number."
    display_artist_info(artist_search_choice, obtain.to_i)
  elsif choice == 2
    puts "Please enter the title of an artwork or a keyword."
    artwork_search_choice = search_by_artwork(obtain.to_i)
    puts "Please choose an artwork using corresponding number."
    display_artwork_info(artwork_search_choice, obtain.to_i)
  elsif choice == 3
    display_saved_artists($user.artists)
  elsif choice == 4
    display_saved_artwork($user.artworks)
  elsif choice == 5
    exit
  else
    puts "Sorry, I do not understand"
    menu
  end
end

def run_program
  welcome
  get_user
  menu
end


def search_by_artist(name)
  artist_api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 10,
                         q: "displayname:'#{name}'", ### user input
                         sort: "displayname",
                         sortorder: "asc",
                         fields: "displayname," "culture," "id," "url",
                         apikey: ENV['API_KEY']}},
                        )
      artist_array = JSON.parse(artist_api_result)["records"]
      fav_artists = artist_array.select do |artist|
        artist["culture"] != nil
      end
    print_artist_results(fav_artists)
    return fav_artists
    binding.pry

end

def search_by_artwork(title)
  artwork_api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/object",
      headers: {params: {size: 10,
                         q: "title:'#{title}'", ### user input
                         sort: "title",
                         sortorder: "asc",
                         fields: "title," "primaryimageurl," "people.name",
                         apikey: ENV['API_KEY']}},
      )
      artwork_array = JSON.parse(artwork_api_result)["records"]
      fav_artworks = artwork_array.select do |artwork|
        artwork["primaryimageurl"] != nil
      end
    print_artwork_results(fav_artworks)
    return fav_artworks
end

############### SAVE TO DB METHODS #############

def save_artist(artist)
  new = Artist.find_or_create_by(name: artist["displayname"],
                                 culture: artist["culture"],
                                 api_id: artist["id"])
  ArtistUser.find_or_create_by(artist_id: new.id, user_id: $user.id)
end

def save_artwork(artwork)
  new = Artwork.find_or_create_by(title: artwork["title"],
                                  artist: artwork["people"][0]["name"],
                                  image_url: artwork["primaryimageurl"],
                                  api_id: artwork["id"])
  UserArtwork.find_or_create_by(user_id: $user.id, artwork_id: new.id)
end

# will gets.chomp name
# refactor, probably

def save_user(name)
  $user = User.find_or_create_by(name: name)
end


########### ARTIST METHODS #############

def print_artist_results(arr)
  arr.each.with_index(0) do |arr, index|
    puts "#{index}. " + arr['displayname']
    puts "\n"
  end
end

def display_artist_info(arr, i)
  puts "Name: " + arr[i]["displayname"]
  puts "Culture: " + arr[i]["culture"]
  puts "URL: " + arr[i]["url"]
end

def display_saved_artists(arr)
  arr.each.with_index(0) do |arr, index|
    puts "#{index}. #{arr.name}\n   #{arr.culture}"
    puts "\n"
end
end


##### ARTWORK METHODS ######

  def print_artwork_results(arr)
    arr.each.with_index(0) do |data, index|
      puts "#{index}. " + data['title'][0..100]
      puts "\n"
    end
  end

  def display_artwork_info(arr, i)
    puts "Title: " + arr[i]["title"]
    puts "Artist: " + arr[i]["people"][0]["name"]
    puts "Image: " + arr[i]["primaryimageurl"]
  end

  def display_saved_artwork(arr)
    arr.each.with_index(0) do |arr, index|
      puts "#{index}. Title: #{arr.title[0..100]}\n   Artist:  #{arr.artist}\n   URL: #{arr.image_url}"
      puts "\n"
    end
  end

  def open_image(arr, i)
    imgurl = arr[i]["primaryimageurl"]
    system("open -a Safari #{imgurl}")
  end

binding.pry

puts "bye!"
