require 'bundler'
Bundler.require

require './politely'

class App < Sinatra::Base
	
	get "/" do
		Politely.random
	end

end