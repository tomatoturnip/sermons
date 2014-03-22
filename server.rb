require 'sinatra'
require 'shotgun'
require 'pry'
require 'csv'
require_relative 'sermons'



get '/' do

  @sermons_array = []
  CSV.foreach('messages_index.csv', headers:true) do |row|
    @sermons_array << Sermon.new(row["Speaker"], row["Subject"], row["Venue"], row["Conference"], row["Year"], row["File"])
  end

  @sermons_array
  erb :sermons
end

# get '/leaderboard' do
#   @team_stats_sorted = team_stats_sorted
#   erb :leaderboard
# end

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
