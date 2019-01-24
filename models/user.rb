class User < ActiveRecord::Base
  has_many :artists, through: :artist_users
  has_many :artworks, through: :user_artworks
end
