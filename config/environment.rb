require 'bundler/setup'
# require 'sinatra-activerecord'
require 'sqlite3'
require 'pry'
require 'require_all'
require 'dotenv'
require 'json'
require 'rest-client'
require 'active_record'
require 'open-uri'

# require 'uri'

Bundler.require
Dotenv.load
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
