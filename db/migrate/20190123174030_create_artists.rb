class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name # displayname
      t.string :culture
      t.integer :artist_object_id
    end
  end
end
