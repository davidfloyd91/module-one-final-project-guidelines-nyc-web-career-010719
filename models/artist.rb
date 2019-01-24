class Artist < ActiveRecord::Base
  has_many :users, through: :artist_users
  has_many :artworks, through: :artist_artworks
end
