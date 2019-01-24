# require 'rest-client'
# require 'json'
# require 'pry'


#
# def search_by_artist(artist)
#   api_result = RestClient::Request.execute(method: :get,
#           url: "https://api.harvardartmuseums.org/person",
#       headers: {params: {size: 100,
#                          q: "displayname:'#{artist}'",
#                          sort: "displayname",
#                          sortorder: "asc",
#                          fields: "displayname",
#                          apikey: ENV['API_KEY']}},
#       )
# response_hash = JSON.parse(api_result)["records"]
# end
#
# search_by_artist("magritte")
#
#
# binding.pry
