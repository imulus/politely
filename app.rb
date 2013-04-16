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

  get "/random.?:format?" do |format|
    compliment = Politely.random

    case format
    when 'json'
      content_type :json
      compliment.to_json
    else
      content_type 'text/plain'
      compliment
    end
  end

end
