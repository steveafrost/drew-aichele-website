# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :url_root, 'https://drewaichele.com'
activate :search_engine_sitemap

# Development Configuration
configure :development do
  activate :livereload
end

# Build configuration
configure :build do
  activate :asset_hash
  activate :minify_javascript
  activate :minify_css
  activate :gzip
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before    = true
  deploy.deploy_method   = :ftp
  deploy.host            = ENV['FTPHOST']
  deploy.path            = ENV['FTPPATH']
  deploy.user            = ENV['FTPUSER']
  deploy.password        = ENV['FTPPASSWORD']
  deploy.port            = 21
end
