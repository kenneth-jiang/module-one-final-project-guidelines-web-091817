require 'bundler'
require 'json'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require_all 'lib'
