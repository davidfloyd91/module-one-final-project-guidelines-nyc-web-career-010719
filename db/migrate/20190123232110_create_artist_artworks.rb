class CreateArtistArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_artworks do |t|
      t.integer :artwork_id
      t.integer :artist_id
    end
  end
end
