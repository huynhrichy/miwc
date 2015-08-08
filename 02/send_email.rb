# include the mailgun gem.
require 'mailgun'

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
  :from => "from@sandboxed0cc0f0ca1e4fda8600382c76748ad7.mailgun.org"
}

@mailgun.messages.send_email(parameters)