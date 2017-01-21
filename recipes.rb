###############
# recipes.rb
# 21.01.17
# Marcela Rubim
###############

require 'sinatra'

set :root, File.dirname(__FILE__)

get '/' do
  'Recipes App Teste'
end
