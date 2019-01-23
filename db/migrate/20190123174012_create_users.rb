class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      # t.integer :user_artist_id
    end
  end
end
