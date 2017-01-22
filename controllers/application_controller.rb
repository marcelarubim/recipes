require 'data_mapper'
require 'json'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/recipes.db")

class ApplicationController < Sinatra::Base
  configure do
    set :root, File.dirname(__FILE__)
    set :show_exceptions, :after_handler
  end

  configure :development do
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  before do
    content_type :json
  end

  get '/' do
    "Hello, World!"
  end
end
