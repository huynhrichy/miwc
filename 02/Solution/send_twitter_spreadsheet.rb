require 'mailgun'
require 'csv'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "YOUR_API_KEY"
  config.consumer_secret = "YOUR_API_SECRET"
end

CSV.open("my_results.csv", "wb") do |csv|
  client.search("learn to code", :result_type => "recent").take(10).each do |tweet|
  csv << [tweet.user.username, tweet.text]
end

my_file = File.open("my_results.csv")

# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = 'YOUR_API_KEY'
  config.domain  = 'YOUR_MAILGUN_DOMAIN'
end

@mailgun = Mailgun()

parameters = {
  :to => "YOUR_EMAIL",
  :subject => "YOUR_SUBJECT",
  :text => "yeah, we're gonna need you to come in on friday...yeah.",
  :from => "YOUR_MAILGUN_ADDRESS",
  :attachment => my_file
}

@mailgun.messages.send_email(parameters)