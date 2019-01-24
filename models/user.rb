class User < ActiveRecord::Base
  has_many :artists, through: :user_artists
  has_many :artworks, through: :user_artworks

  # I frankly have no idea how this will work or where it should be defined
  # will receive name through gets.chomp
  def login(name)
    existing? = User.find_by(name: name)
    if !existing?
      save_user(name)
    else
      # what does logging in even mean?
  end


end
