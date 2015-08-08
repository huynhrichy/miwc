require 'sinatra'
require 'erb'
require_relative 'twitter_wrapper'

# replace YOUR_PORT with your personal port
set :port, 5179
    
# allow external access (e.g. you can access from http://students.codein10weeks.com:YOUR_PORT)
set :bind, '0.0.0.0'
set :server, 'webrick'

get '/' do
  my_tweeter = TwitterWrapper.new("Z1Ki2LahzXPUmBN0qTnQIWbp7", "JJkQxJ6A41JongBFEIlrQjEz66CjnlwubZ9LBqmZnczzWECYXx")

  @my_name = "Richard"
  @some_things = ["banana","grape","melon"]
  
  @the_tweets = my_tweeter.search("dofp").take(5).collect do |tweet|
      tweet.text
      #puts "#{tweet.user.screen_name}: #{tweet.text}"
      "#{tweet.user.screen_name}: #{tweet.text}"
  end
  
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
  "Weekly tips on learning to code! http://www.twitter.com/learncodeweekly"
end

get '/my_page' do
  "Some text to be displayed."
end
