###########
# config.ru
#

ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'
require 'sinatra/base'

Bundler.require

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

map('/recipes') { run RecipesController }
map('/ingredients') { run IngredientsController }
map('/') { run ApplicationController }

