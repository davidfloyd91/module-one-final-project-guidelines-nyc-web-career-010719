require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'active_record'

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
seed_loader = Class.new do
  def load_seed
    load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
  end
end
DatabaseTasks.seed_loader = seed_loader.new
load 'active_record/railties/databases.rake'

task :console => :environment do
  Pry.start
end

######


# ########### FROM LEARN.co
# task :environment do
#   require_relative './config/environment'
# end
#
# namespace :db do
#   desc 'migrate changes to your database'
#   task :migrate => :environment do
#     Users.create_table
#     Artist.create_table
#     Artist.create_table
#   end
# end
