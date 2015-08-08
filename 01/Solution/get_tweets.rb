# load the third party code, in about 99%
# of cases, this is the same as the gem
# name
require 'twitter'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "YOUR_API_KEY"
  config.consumer_secret = "YOUR_API_SECRET"
end

# Get the first tweet of the specified user
client.search("learn to code").take(3).collect do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
end