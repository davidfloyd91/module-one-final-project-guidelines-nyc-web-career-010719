class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :artist
      t.string :image_url
      t.integer :api_id
    end
  end
end
