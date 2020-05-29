# Application environment
require 'bundler/setup'
Bundler.reuire(:default)

require_relative './star_wars_library/cli.rb'
require_relative './star_wars_library/api.rb'
require_relative './star_wars_library/film.rb'