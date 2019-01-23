class CreateArtistUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_users do |t|
      t.integer :artist_id
      t.integer :user_id
    end
  end
end
