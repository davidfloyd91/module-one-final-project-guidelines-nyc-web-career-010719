class Artist < ActiveRecord::Base
  has_many :users, through: :user_artists
  has_many :artworks, through: :artist_artworks
end
