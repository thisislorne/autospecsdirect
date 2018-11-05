server 'awoolo.co.nz', user: 'deploy', roles: %w(web app db)

set :rails_env, 'production'
set :nginx_domains, 'awoolo.co.nz www.awoolo.co.nz'
set :branch, :master
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/awoolo.co.nz'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/awoolo.co.nz'
