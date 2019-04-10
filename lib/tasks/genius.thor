require './config/environment'
class Genius < Thor

  desc 'fetch_rpc', 'A task to import any ads from a url'
  def fetch_rpc
    require 'rest-client'
    logger = Logger.new(STDOUT)
    logger.level = Logger::INFO
    Rails.logger = logger

    started = Time.now
    logger.info "[IMPORTER] Started - #{started}"

    token = _get_token


  end

  private

  _get_token
   payload = {
      username: 'bot',
      password: Rails.application.credentials.production[:gbot][:password]
    }

    r = (RestClient::Request.execute(
      :method => :post,
      :url => "https://groovyreports.com/session",
      :payload => payload.to_json,
      :headers => {:content_type => 'application/json'}
    ))

    return JSON.parse(r)['token']
  end


end
