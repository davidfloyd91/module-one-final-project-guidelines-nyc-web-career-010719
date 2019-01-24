class UserArtwork < ActiveRecord::Base
  belongs_to :users
  belongs_to :artworks
end
