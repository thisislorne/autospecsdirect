require File.expand_path(File.dirname(__FILE__) + '/environment')

job_type :thor, 'cd :path && :environment_variable=:environment :rvm_path :rvm_ruby_version do bundle exec thor :task :output'

set :output, {
  standard: Rails.root.join('log', "#{@environment}_cron.log"),
  error: Rails.root.join('log', "#{@environment}_cron_error.log")
}
every :hour do
  thor 'genius:optimise_keywords'
end

# Learn more: http://github.com/javan/whenever
