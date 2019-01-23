# class CreateUsers < ActiveRecord::Migration[5.0]
#
#   def change
#     create_table :users do |t|
#       t.string :name
#       t.integer :user_artist_id
#     end
#   end
#
# end # end of class
#
# ########
#
# class CreateArtists < ActiveRecord::Migration[5.0]
#
#   def change
#     create_table :artists do |t|
#       t.string :name # displayname
#       t.string :culture
#       t.integer :artist_object_id
#     end
#   end
#
# end # end of class
#
# ########
#
# class CreateUserArtists < ActiveRecord::Migration[5.0]
# 
#   def change
#     create_table :user_artists do |t|
#       t.integer :user_id
#       t.integer :artist_id
#     end
#   end
#
# end # end of class
