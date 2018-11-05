# config valid only for current version of Capistrano
lock '3.11.0'

# Required for logrotate to run correctly
set :user, :deploy
set :stages, %w(production staging)
set :default_stage, 'staging'

set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.3.1'

set :application, 'awoolo'

set :repo_url, 'git@github.com:GroovyMedia/awoolo.git'
set :deploy_to, '/home/deploy/awoolo'

set :keep_releases, 2

append :linked_files, 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock" # accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, -> { fetch(:rack_env, fetch(:rails_env, 'production')) }
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

set :logtail_files, %w(/var/log/syslog)
set :logtail_lines, 50

set :logrotate_template_path, "#{stage_config_path}/templates/logrotate.erb"

set :nginx_template, "#{stage_config_path}/templates/nginx.conf.erb"
set :nginx_service_path, '/etc/init.d/nginx'
set :nginx_roles, :web
set :nginx_static_dir, 'public'
set :nginx_application_name, "#{fetch :application}-#{fetch :stage}"
set :nginx_use_ssl, true
set :nginx_ssl_certificate, 'fullchain.pem'
set :nginx_ssl_certificate_key, 'privkey.pem'
set :nginx_read_timeout, 30
set :app_server, true
set :app_server_socket, "#{shared_path}/tmp/sockets/puma.sock"
set :app_server_host, '127.0.0.1'

after 'deploy:publishing', 'deploy:restart'
