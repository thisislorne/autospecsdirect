# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/bundler'
require 'capistrano/dotenv/tasks'
require 'capistrano/logrotate'
require 'capistrano/logtail'
require 'capistrano/nginx'
require 'capistrano/rvm'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rails/console'
require 'capistrano/puma'
require 'capistrano/rails/console' # seperate gem for rails console on production
require 'capistrano/rails/db' # seperate gem for seeding db
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Monit
install_plugin Capistrano::Nginx

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
