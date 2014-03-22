require 'sinatra'
require 'shotgun'
require 'csv'
require_relative 'sermons'

get '/' do
  @sermons_array = Sermon.read_csv('messages_index.csv')
  erb :sermons
end

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
