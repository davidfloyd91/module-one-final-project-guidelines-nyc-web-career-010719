class AddUrlColumnToArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :url, :string
  end
end
