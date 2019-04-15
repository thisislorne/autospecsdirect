Slack.configure do |config|
  config.token = Rails.application.credentials.production[:slack][:token]
end