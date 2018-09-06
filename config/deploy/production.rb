server 'werecommend.co.nz', user: 'deploy', roles: %w(web app db)

set :rails_env, 'production'
set :nginx_domains, 'werecommend.co.nz www.werecommend.co.nz'
set :branch, :master
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/werecommend.co.nz'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/werecommend.co.nz'
