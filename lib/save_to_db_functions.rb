require_all 'models'

# USER = User.find_by(name: "jimbo")

# q =  {"dateend"=>1650,
#   "alphasort"=>"Verwer, Abraham de",
#   "displaydate"=>"1585 - 1650",
#   "url"=>"https://www.harvardartmuseums.org/collections/person/65236",
#   "deathplace"=>"Amsterdam",
#   "id"=>65236,
#   "objectcount"=>1,
#   "lastupdate"=>"2019-01-23T03:21:45-0500",
#   "ulan_id"=>"500009736",
#   "datebegin"=>1585,
#   "birthplace"=>"Haarlem",
#   "personid"=>65236,
#   "gender"=>"male",
#   "culture"=>"Dutch",
#   "displayname"=>"Abraham de Verwer"}
#
# x = {"id"=>259239,
#     "title"=>"Four Horsemen of the Apocalypse",
#     "imagepermissionlevel"=>0,
#     "primaryimageurl"=>"https://nrs.harvard.edu/urn-3:HUAM:INV041784_dynmc",
#     "people"=>[{"name"=>"Ieronymus Greff"}, {"name"=>"Albrecht Dürer"}]}

def save_artist(artist)
  new = Artist.find_or_create_by(name: artist["displayname"],
                                 culture: artist["culture"],
                                 api_id: artist["id"])
  ArtistUser.find_or_create_by(artist_id: new.id, user_id: USER.id)
end

def save_artwork(artwork)
  new = Artwork.find_or_create_by(title: artwork["title"],
                                  artist: artwork["people"][0]["name"],
                                  image_url: artwork["primaryimageurl"],
                                  api_id: artwork["id"])
  UserArtwork.find_or_create_by(user_id: USER.id, artwork_id: new.id)
end

# will gets.chomp name
# refactor, probably
def save_user(name)
  User.find_or_create_by(name: name)
end
