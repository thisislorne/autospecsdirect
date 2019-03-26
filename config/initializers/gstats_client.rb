GstatsClient.configure do |config|
  config.enabled = ActiveRecord::Type::Boolean.new.cast(Rails.application.credentials.production[:gstats][:enabled]) || false
  config.project_id = Rails.application.credentials.production[:gstats][:site]
  config.api_key = Rails.application.credentials.production[:gstats][:api_key]
  config.new_relic_enabled = Rails.application.credentials.production[:newrelic][:license_key].present?
end
