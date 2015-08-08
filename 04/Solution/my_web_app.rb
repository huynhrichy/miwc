require 'sinatra'
require 'erb'
require_relative "twitter_wrapper"

# replace YOUR_PORT with your personal port
set :port, YOUR_PORT
    
# allow external access (e.g. you can access from http://students.codein10weeks.com:YOUR_PORT)
set :bind, '0.0.0.0'

get '/' do
  @my_tweeter = TwitterWrapper.new(key, secret)
  @my_tweets = @my_tweeter.search("learn to code").take(3).collect do |tweet|
    tweet.text
  end
  @my_name = "your_name"
  @some_things = ["banana", "grape", "melon"]
  @bad_things = ["carrots", "broccoli", "sprouts"]
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
  "Weekly tips on learning to code! http://www.twitter.com/learncodeweekly"
end

get '/my_page' do
  "Some text to be displayed."
end
