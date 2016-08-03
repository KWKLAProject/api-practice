require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
	
	get '/results' do
		@results = get_data_from_api
		erb :results
	end
	
	post '/results' do
		@results = get_data_from_api
		user_search = params[:giphy]
		@giphy_link = format_request_and_call_api(user_search)
		erb :results
	end


end