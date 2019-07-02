server '34.232.222.53', user: 'deploy', roles: %w(web app db)

set :rails_env, 'staging'
set :nginx_domains, 'staging.searchbe.com'
set :branch, :rewrite
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/staging.searchbe.com'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/staging.searchbe.com'
