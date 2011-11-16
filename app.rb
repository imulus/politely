require 'bundler'
Bundler.require

require './politely'

class App < Sinatra::Base
 	set :public_folder, File.dirname(__FILE__) + '/public'
	
	get "/" do
		@compliment = Politely.random
    erb :index		
	end
	
	get "/compliments.json" do
		content_type :json
		Politely.compliments.to_json
	end	
	

	get "/random" do
		content_type 'text/plain'
		Politely.random
	end

	get "/random.json" do
		content_type :json
		Politely.random.to_json
	end

end