### this will become the search function?

require 'rest-client'
require 'json'
require 'pry'

# api_result = RestClient::Request.execute(method: :get,
#                                             url: "https://api.harvardartmuseums.org/Object",
#                                         headers: {params: {size: 100,
#                                                            q: "id:>1000",
#                                                            sort: "id",
#                                                            sortorder: "asc",
#                                                            fields: "id,culture",
#                                                            apikey: "9a272830-1e82-11e9-bba4-5558a1e647f5"}},
#                                         )
#
# response_hash = JSON.parse(api_result)["records"]

# response = RestClient.get("https://api.harvardartmuseums.org/Object?apikey=9a272830-1e82-11e9-bba4-5558a1e647f5")
# art_data = JSON.parse(response.body)["records"]



def search_by_artist(artist)
  binding.pry
  api_result = RestClient::Request.execute(method: :get,
          url: "https://api.harvardartmuseums.org/person",
      headers: {params: {size: 100,
                         q: "displayname:'#{artist}'",
                         sort: "displayname",
                         sortorder: "asc",
                         fields: "displayname",
                         apikey: ENV['API_KEY']}},
      )
response_hash = JSON.parse(api_result)["records"]
end

search_by_artist("magritte")

# def search_by_object(tbd)
#   api_result = RestClient::Request.execute(method: :get,
#           url: "https://api.harvardartmuseums.org/object",
#       headers: {params: {size: 100,
#                          q: "displayname:'#{artist}'",
#                          sort: "displayname",
#                          sortorder: "asc",
#                          # fields: ,
#                          apikey: "9a272830-1e82-11e9-bba4-5558a1e647f5"}},
#       )
# response_hash = JSON.parse(api_result)["records"]
# end

binding.pry

0
