class ArtistUser < ActiveRecord::Base
  belongs_to :artists
  belongs_to :users
end
