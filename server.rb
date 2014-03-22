require 'sinatra'
require 'shotgun'
require 'csv'

require_relative 'sermons'

csv = 'messages_index.csv'

get '/' do
  sermons_array = Sermon.read_csv(csv)
  @results_array = []

  if !params[:query].nil?
    sermons_array.each do |sermon|
      sermon.make_array.each do |item|
        if item.to_s.downcase.include?(params[:query].downcase)
          @results_array << sermon
        end
      end
    end
  else
    @results_array = sermons_array
  end

  erb :sermons
end





set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
