class User < ActiveRecord::Base
  has_many :artist_users
  has_many :artists, through: :artist_users
  has_many :user_artworks
  has_many :artworks, through: :user_artworks
end
