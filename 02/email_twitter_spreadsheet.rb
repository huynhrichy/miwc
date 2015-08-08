require 'mailgun'
require 'twitter'
require 'csv'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "Z1Ki2LahzXPUmBN0qTnQIWbp7"
  config.consumer_secret = "JJkQxJ6A41JongBFEIlrQjEz66CjnlwubZ9LBqmZnczzWECYXx"
end


CSV.open("my_results.csv", "wb") do |csv|
    csv << ["Tweeter","Tweet"]
    client.search("dofp", result_type: "recent").take(5).collect do |tweet|
        csv << [tweet.user.screen_name, tweet.text]
    end
end

my_file = File.open("my_results.csv")

# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = 'key-940t68kpj12055tjhi9yzi1993zo0653'
  config.domain  = 'sandboxed0cc0f0ca1e4fda8600382c76748ad7.mailgun.org'
end

@mailgun = Mailgun()

parameters = {
  :to => "richardbaohuynh@gmail.com",
  :subject => "subject",
  :text => "text",
  :from => "from@sandboxed0cc0f0ca1e4fda8600382c76748ad7.mailgun.org",
  :attachment => my_file
}

@mailgun.messages.send_email(parameters)