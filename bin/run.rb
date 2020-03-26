require_relative '../config/environment'
require_relative '../lib/CLI.rb'

cli = CommandLineInterface.new
cli.opening_greeting
1000000.times{cli.inner_greeting}