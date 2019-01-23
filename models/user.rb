class User < ActiveRecord::Base
  has_many :user_artists
  has_many :artists, through: :user_artists
end
