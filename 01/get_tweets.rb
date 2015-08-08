# load the third party code, in about 99%
# of cases, this is the same as the gem
# name
require 'twitter'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "Z1Ki2LahzXPUmBN0qTnQIWbp7"
  config.consumer_secret = "JJkQxJ6A41JongBFEIlrQjEz66CjnlwubZ9LBqmZnczzWECYXx"
end

# Get the first tweet of the specified user
#client.user_timeline('bryansinger').each do |tweet|
client.search("big hero 6", result_type: "recent").take(10).collect do |tweet|
    puts tweet.text
end; nil
