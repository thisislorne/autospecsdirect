server 'staging.autospecsdirect.com', user: 'deploy', roles: %w(web app db)

set :rails_env, 'staging'
set :nginx_domains, 'staging.autospecsdirect.com'
set :branch, :rewrite
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/staging.autospecsdirect.com'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/staging.autospecsdirect.com'
