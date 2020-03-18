source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Tooltips and popovers depend on tether for positioning. If you use them, add tether to the Gemfile:
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'administrate'
gem 'browser'
gem 'gstats_client', git: 'git@github.com:GroovyMedia/gstats_client.git', :tag => 'v0.2.9'
gem 'groovy_geo', git: 'git@github.com:GroovyMedia/groovy_geo.git', :tag => 'v0.1.5'
gem 'mini_racer'
gem 'newrelic_rpm'
gem 'slack-ruby-client'
gem 'thor'
gem 'whenever', require: false

gem 'trix-rails', require: 'trix'
gem 'administrate-field-trix'
gem 'bootstrap', '4.0.0.alpha6'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-dotenv-tasks', require: false
  gem 'capistrano-logrotate', require: false
  gem 'capistrano-logtail', require: false
  gem 'capistrano-rails'
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-nginx'
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rails-db'
end
