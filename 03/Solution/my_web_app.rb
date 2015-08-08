require 'sinatra'
require 'erb'

# replace YOUR_PORT with your personal port
set :port, YOUR_PORT
    
# allow external access (e.g. you can access from http://students.codein10weeks.com:YOUR_PORT)
set :bind, '0.0.0.0'

get '/' do
  @my_name = "your_name"
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
  "Weekly tips on learning to code! http://www.twitter.com/learncodeweekly"
end

get '/my_page' do
  "Some text to be displayed."
end
