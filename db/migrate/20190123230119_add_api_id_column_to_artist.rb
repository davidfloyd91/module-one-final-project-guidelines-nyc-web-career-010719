class AddApiIdColumnToArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :api_id, :integer
  end
end
