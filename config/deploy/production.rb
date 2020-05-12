server 'autospecsdirect.com', user: 'deploy', roles: %w(web app db)

set :rails_env, 'production'
set :nginx_domains, 'autospecsdirect.com www.autospecsdirect.com'
set :branch, :master
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/autospecsdirect.com'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/autospecsdirect.com'
