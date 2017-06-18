# SVG Helper
helpers do
  def inline_svg name
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    if File.exists?(file_path)
      File.read(file_path)
    else
      "<span class='icon-error'>Icon #{name} not found</span>"
    end
  end
end

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
activate :sprockets

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :url_root, 'https://drewaichele.com'
set :relative_links, true
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
  deploy.build_before = true
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
