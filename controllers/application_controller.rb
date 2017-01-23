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
    DataMapper.auto_migrate!
    # DataMapper.auto_upgrade!
  end

  before do
    content_type :json
  end

  get '/' do
    "Hello, World!"
  end

  not_found do
    {:result => 'error', :message => 'not found'}.to_json
  end

  error 400 do
    {:result => 'error', :message => 'bad request'}.to_json
  end
end
