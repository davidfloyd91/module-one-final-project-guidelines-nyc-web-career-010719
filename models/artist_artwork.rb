class ArtistArtwork < ActiveRecord::Base
  belongs_to :artists
  belongs_to :artworks
end
