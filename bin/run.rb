
require_relative '../config/environment.rb'
# require_relative "../lib/api_communicator.rb"
# require_relative '../lib/cli.rb'
 #require_relative '../db/seeds.rb'
ActiveRecord::Base.logger.level = 1

CLI.new.start_program
