require 'csv'
require 'mailgun'

CSV.open("my_results.csv", "wb") do |csv|
  csv << ["animal", "count", "price"]
  csv << ["fox", "1", "$90.00"]
end

my_file = File.open("my_results.csv")

Mailgun.configure do |config|
  config.api_key = 'YOUR_API_KEY'
  config.domain  = 'YOUR_MAILGUN_DOMAIN'
end

@mailgun = Mailgun()

parameters = {
  :to => "YOUR_EMAIL",
  :subject => "Missing TPS reports",
  :text => "yeah, we're gonna need you to come in on friday...yeah.",
  :from => "lumberg.bill@initech.mailgun.domain",
  :attachment => my_file
}

@mailgun.messages.send_email(parameters)