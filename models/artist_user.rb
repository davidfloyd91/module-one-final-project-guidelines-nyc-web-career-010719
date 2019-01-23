class ArtistUser < ActiveRecord::Base
  belongs_to :artists, :users
end
