require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'active_record'
require_all 'lib'
require_all 'models'

task :environment do
  require_relative './config/environment'
end

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

include ActiveRecord::Tasks
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = 'db/migrate'
