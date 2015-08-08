# load the third party code, in about 99%
# of cases, this is the same as the gem
# name
require 'twitter'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "Z1Ki2LahzXPUmBN0qTnQIWbp7"
  config.consumer_secret = "JJkQxJ6A41JongBFEIlrQjEz66CjnlwubZ9LBqmZnczzWECYXx"
  config.access_token        = "816024174-OjBTlIhq0xXDB120hA9hbHe7jNMqanPLM1XOUICO"
  config.access_token_secret = "XxWmfqBCpF26aQroZI52HBCAjD6My47XN9hg3B5oZbNXD"
end

client.update("le tweet")