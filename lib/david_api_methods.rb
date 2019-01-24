# basically obsolete

def search_by_artist(artist)
  api_result = RestClient::Request.execute(method: :get,
      url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 10,
                         q: "displayname:'#{artist}'",
                         sort: "displayname",
                         sortorder: "asc",
                         # fields: "displayname",
                         apikey: ENV['API_KEY']}},)
response_hash = JSON.parse(api_result)["records"]
end

# search_by_artist("magritte")

#####

def search_by_artist_culture(artist)
 api_result = RestClient::Request.execute(method: :get,
     url: "https://api.harvardartmuseums.org/person",
     headers: {params: {size: 10,
                        q: "displayname:'#{artist}'",
                        sort: "displayname",
                        sortorder: "asc",
                        # fields: "displayname",
                        apikey: ENV['API_KEY']}},)
      response_hash = JSON.parse(api_result)["records"]
      fav_person = response_hash.select do |person|
        person["culture"] != nil
      end
      fav_person[0]["culture"]
end

#####

def search_by_culture(culture)
  api_result = RestClient::Request.execute(method: :get,
      url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 10,
                         q: "culture:'#{culture}'",
                         sort: "displayname",
                         sortorder: "asc",
                         # fields: "displayname",
                         apikey: ENV['API_KEY']}},)
  response_hash = JSON.parse(api_result)["records"]
end

# culture = search_by_artist_culture("van gogh")
# puts culture
# binding.pry
# puts search_by_culture(culture)

# puts search_by_artist("magritte")
