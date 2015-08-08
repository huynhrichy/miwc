require 'sinatra'
require 'erb'

# replace YOUR_PORT with your personal port
set :port, 5179

# allow external access (e.g. you can access from you personal URL)
set :bind, '0.0.0.0'
set :server, 'webrick'

get '/' do
    @my_name = "Richard"
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
    "Weekly tips on learning to code! http://www.twitter.com/learncodeweekly"
end

get '/my_page' do
    "some text"
end