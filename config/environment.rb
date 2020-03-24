require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

require_all 'app/models'
<<<<<<< HEAD
require_relative 'db/seeds.rb'
=======
# require_relative 'db/seeds.rb'
>>>>>>> 53b59bd2858c640b5fc555bcdf6a64e5ed1c7b71
