class User < ActiveRecord::Base
  has_many :artists, through: :user_artists
  has_many :artworks, through: :user_artworks
end
