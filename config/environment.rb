require 'bundler/setup'
require 'sqlite3'
require 'pry'
require 'require_all'
require 'dotenv'
require 'json'
require 'rest-client'
require 'active_record'


Bundler.require
Dotenv.load
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
