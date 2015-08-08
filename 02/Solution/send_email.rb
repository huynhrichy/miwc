# include the mailgun gem.
require 'mailgun'

# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = 'YOUR_API_KEY'
  config.domain  = 'YOUR_MAILGUN_DOMAIN'
end

@mailgun = Mailgun()

parameters = {
  :to => "YOUR_EMAIL",
  :subject => "Missing TPS reports",
  :text => "yeah, we're gonna need you to come in on friday...yeah.",
  :from => "lumberg.bill@initech.mailgun.domain"
}
@mailgun.messages.send_email(parameters)