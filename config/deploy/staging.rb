server 'staging.werecommend.co.nz', user: 'deploy', roles: %w(web app db)

set :rails_env, 'staging'
set :nginx_domains, 'staging.werecommend.co.nz'
set :branch, :staging
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/staging.werecommend.co.nz'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/staging.werecommend.co.nz'
