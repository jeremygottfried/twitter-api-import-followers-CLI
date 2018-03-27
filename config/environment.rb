require 'pry'
require_relative '../app/models/twitter'
require "sinatra/activerecord"
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/twitter.db"
)
