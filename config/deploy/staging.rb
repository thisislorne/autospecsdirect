server 'staging.awoolo.co.nz', user: 'deploy', roles: %w(web app db)

set :rails_env, 'staging'
set :nginx_domains, 'staging.awoolo.co.nz'
set :branch, :staging
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/staging.awoolo.co.nz'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/staging.awoolo.co.nz'
