server 'searchbe.com', user: 'deploy', roles: %w(web app db)

set :rails_env, 'production'
set :nginx_domains, 'searchbe.com www.searchbe.com'
set :branch, :master
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/searchbe.com'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/searchbe.com'
