require_relative './api_methods'
require_all 'models'
require_relative '../config/environment.rb'

$user = nil

def welcome
  puts "\nWelcome to the Harvard Art Museum API Querier!"
end

def obtain
  gets.chomp
end

def get_user
  puts "\nPlease enter your name to sign into your existing account or to create a new one."
  save_user(obtain)
end

def menu
  puts "\nHi #{$user.name}!"
  puts "\nPlease choose from the options below:\n\n1. Search by artist\n2. Search by artwork\n3. Access saved artists\n4. Access saved artworks\n5. Exit"
  choice = obtain.to_i

  if choice == 1
    puts "\nPlease enter the name of an artist."
    artist_search_result = search_by_artist(obtain)
    if artist_search_result == []
      puts "\nSorry, no results found."
      menu
    end
    puts "\nPlease choose an artist using the corresponding number."
    artist_choice = obtain.to_i
    $current_artist = artist_search_result[artist_choice]
    display_artist_info(artist_search_result, artist_choice)
    artist_menu

  elsif choice == 2
    puts "\nPlease enter the title of an artwork or a keyword."
    artwork_search_result = search_by_artwork(obtain)
    if artwork_search_result == []
      puts "\nSorry, no results found."
      menu
    end
    puts "\nPlease choose an artwork using the corresponding number."
    artwork_choice = obtain.to_i
    $current_artwork = artwork_search_result[artwork_choice]
    display_artwork_info(artwork_search_result, artwork_choice)
    artwork_menu

  elsif choice == 3
    saved_artist_result = display_saved_artists($user.artists)
    if saved_artist_result == []
      puts "\nYou do not have any saved artists."
      menu
    end
    puts "\nPlease choose from the options below:\n1. Open an artist's URL\n2. Delete an artist\n3. Return to main menu"
    artist_action_choice = obtain.to_i
      if artist_action_choice == 1
        puts "\nPlease choose an artist using the corresponding number."
        saved_artist_choice = obtain.to_i
        $current_artist = saved_artist_result[saved_artist_choice]
        url = get_artist_url($current_artist)
        system("open -a Safari #{url}")
      elsif artist_action_choice == 2
        puts "\nPlease choose an artist using the corresponding number."
        saved_artist_choice = obtain.to_i
        $current_artist = saved_artist_result[saved_artist_choice]
        $current_artist.destroy
      elsif artist_action_choice == 3
        menu
      else
        puts "\nSorry, I do not understand ; (."
      end
    menu

  elsif choice == 4
    saved_artwork_result = display_saved_artwork($user.artworks)
    if saved_artwork_result == []
      puts "\nYou do not have any saved artworks."
      menu
    else
      puts "\nPlease choose from the options below:\n1. Open an artwork's URL\n2. Delete an artwork\n3. Update an artwork title\n4. Return to main menu"
      artwork_action_choice = obtain.to_i
        if artwork_action_choice == 1
          puts "\nPlease choose an artwork using the corresponding number."
          saved_artwork_choice = obtain.to_i
          $current_artwork = saved_artwork_result[saved_artwork_choice]
          system("open -a Safari #{$current_artwork.image_url}")
        elsif artwork_action_choice == 2
          puts "\nPlease choose an artwork using the corresponding number."
          saved_artwork_choice = obtain.to_i
          $current_artwork = saved_artwork_result[saved_artwork_choice]
          $current_artwork.destroy
        elsif artwork_action_choice == 3
          puts "\nPlease choose an artwork using the corresponding number."
          saved_artwork_choice = obtain.to_i
          $current_artwork = saved_artwork_result[saved_artwork_choice]
          puts "\nPlease enter an updated title."
          user_title = obtain
          $current_artwork.title = user_title
          $current_artwork.save
          menu
        elsif artwork_action_choice == 4
          menu
        else
          puts "\nSorry, I do not understand ; (."
        end
      end
      menu

  elsif choice == 5
    "\nGoodbye, #{$user}\n"
    exit
  else
    puts "\nSorry, I do not understand ; (."
    menu
  end
end

def artist_menu
  puts "\nPlease choose from the options below:\n1. Open URL\n2. Find similar artists \n3. Save artist to profile\n4. Return to main menu"
    choice = obtain.to_i
    if choice == 1
      open_artist_url($current_artist)
      artist_menu
    elsif choice == 2
      culture_search_result = search_by_culture($current_artist["culture"])
      puts "\nPlease choose an artist using the corresponding number."
      culture_choice = obtain.to_i
      $current_artist = culture_search_result[culture_choice]
      display_artist_info(culture_search_result, culture_choice)
      artist_menu
    elsif choice == 3
      save_artist($current_artist)
      artist_menu
    elsif choice == 4
      menu
    else
      "\nSorry, I do not understand ; (."
      artist_menu
   end
 end

def artwork_menu
  puts "\nPlease choose from the options below:\n1. Open image\n2. Save artwork to profile\n3. Return to main menu"
    choice = obtain.to_i
    if choice == 1
      open_image_url($current_artwork)
      artwork_menu
    elsif choice == 2
      save_artwork($current_artwork)
      artwork_menu
    elsif choice == 3
      menu
    else
      "\nSorry, I do not understand ; (."
      artwork_menu
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
                         sort: "objectcount",
                         sortorder: "desc",
                         # fields: "displayname," "culture," "id," "url",
                         apikey: ENV['API_KEY']}},
                        )
      artist_array = JSON.parse(artist_api_result)["records"]
      fav_artists = artist_array.select do |artist|
        artist["culture"] != nil
      end
    print_artist_results(fav_artists)
    return fav_artists
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

def search_by_culture(culture)
  api_result = RestClient::Request.execute(method: :get,
      url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 10,
                         q: "culture:'#{culture}'",
                         sort: "objectcount",
                         sortorder: "desc",
                         # fields: "displayname",
                         apikey: ENV['API_KEY']}},)
     artist_array = JSON.parse(api_result)["records"]
     fav_artists = artist_array.select do |artist|
       artist["url"] != nil
     end
   print_artist_results(fav_artists)
   return fav_artists
end

def get_artist_url(artist)
  api_result = RestClient::Request.execute(method: :get,
      url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 1,
                         q: "id:#{artist.api_id.to_i}",
                         sort: "displayname",
                         sortorder: "asc",
                         # fields: "displayname",
                         apikey: ENV['API_KEY']}},)
  url = JSON.parse(api_result)["records"][0]["url"]
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
  puts "\nName: " + arr[i]["displayname"]
  puts "Culture: " + arr[i]["culture"]
  puts "URL: " + arr[i]["url"]
end

def display_saved_artists(arr)
  arr.each.with_index(0) do |arr, index|
    puts "#{index}. #{arr.name}\n   #{arr.culture}\n"
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
    puts "\nTitle: " + arr[i]["title"]
    puts "Artist: " + arr[i]["people"][0]["name"]
    puts "Image: " + arr[i]["primaryimageurl"]
  end

  def display_saved_artwork(arr)
    arr.each.with_index(0) do |arr, index|
      puts "#{index}. Title: #{arr.title[0..100]}\n   Artist:  #{arr.artist}\n   URL: #{arr.image_url}"
      puts "\n"
    end
  end

  def open_artist_url(artist)
    imgurl = artist["url"]
    system("open -a Safari #{imgurl}")
  end

  def open_image_url(artwork)
    imgurl = artwork["primaryimageurl"]
    system("open -a Safari #{imgurl}")
  end


  run_program
