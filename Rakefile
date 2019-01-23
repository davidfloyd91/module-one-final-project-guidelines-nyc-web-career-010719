require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'active_record'
require_all 'lib'

# task :environment do
#   require_relative 'config/environment'
# end

# task :environment do
#   ENV["ACTIVE_RECORD_ENV"] ||= "development"
#   require_relative './config/environment'
# end

include ActiveRecord::Tasks
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = 'db/migrate'
# seed_loader = Class.new do
#   def load_seed
#     load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
#   end
# end
#
#
#
# DatabaseTasks.seed_loader = seed_loader.new
# load 'active_record/railties/databases.rake'

# namespace :db do
# desc 'seed the database with some dummy data'
# task :seed do
#   require_relative './db/seeds.rb'
# end
# end

task :environment do
  require_relative './config/environment'
end

task :console => :environment do
  require_all 'models'
  require_relative './config/environment'
  Pry.start
end

######


# ########### FROM LEARN.co

# namespace :db do
#   desc 'migrate changes to your database'
#   task :migrate => :environment do
#     Users.create_table
#     Artist.create_table
#     Artist.create_table
#   end
# end
