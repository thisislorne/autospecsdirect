server 'awoolo.com', user: 'deploy', roles: %w(web app db)

set :rails_env, 'production'
set :nginx_domains, 'awoolo.com www.awoolo.com'
set :branch, :master
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/awoolo.com'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/awoolo.com'
