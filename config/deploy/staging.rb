server 'staging.awoolo.com', user: 'deploy', roles: %w(web app db)

set :rails_env, 'staging'
set :nginx_domains, 'staging.awoolo.com'
set :branch, :staging
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/staging.awoolo.com'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/staging.awoolo.com'
