class ArtistArtwork < ActiveRecord::Base
  belongs_to :artist
  belongs_to :artwork
end
