###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

activate :google_analytics do |ga|
    ga.tracking_id = data.settings.google_analytics.tracking_code
    ga.anonymize_ip = true
    ga.debug = false
    ga.development = false
    ga.minify = true
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash
  
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-87387307-1'

    # Removing the last octet of the IP address (default = false)
     ga.anonymize_ip = false

     # Tracking across a domain and its subdomains (default = nil)
     ga.domain_name = 'mathieuchiron.com'

     # Tracking across multiple domains and subdomains (default = false)
     ga.allow_linker = false

     # Enhanced Link Attribution (default = false)
     ga.enhanced_link_attribution = false

     # Tracking Code Debugger (default = false)
     ga.debug = false

     # Tracking in development environment (default = true)
     ga.development = true

     # Compress the JavaScript code (default = false)
     ga.minify = false

     # Output style - :html includes <script> tag (default = :html)
     ga.output = :js
  end

  # Favicon

  activate :favicon_maker do |f|
      f.template_dir  = File.join(root, 'source')
      f.output_dir    = File.join(root, 'build')
      f.icons = {
        "_favicon.png" => [
          { icon: "apple-touch-icon-152x152-precomposed.png" },
          { icon: "apple-touch-icon-144x144-precomposed.png" },
          { icon: "apple-touch-icon-120x120-precomposed.png" },
          { icon: "apple-touch-icon-114x114-precomposed.png" },
          { icon: "apple-touch-icon-76x76-precomposed.png" },
          { icon: "apple-touch-icon-72x72-precomposed.png" },
          { icon: "apple-touch-icon-60x60-precomposed.png" },
          { icon: "apple-touch-icon-57x57-precomposed.png" },
          { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
          { icon: "apple-touch-icon.png", size: "57x57" },
          { icon: "favicon-196x196.png" },
          { icon: "favicon-160x160.png" },
          { icon: "favicon-96x96.png" },
          { icon: "favicon-32x32.png" },
          { icon: "favicon-16x16.png" },
          { icon: "favicon.png", size: "16x16" },
          { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
          { icon: "mstile-144x144", format: "png" },
        ]
      }
    end

  # Site map
  activate :sitemap, hostname: data.settings.site.url

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true
  
  # Minify
  activate :minify_css
  activate :minify_javascript
  activate :minify_html, remove_input_attributes: false 

  # Gzip compression
   activate :gzip

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  #
  require_relative "./lib/build_cleaner"
  activate :build_cleaner
end

# Deployment
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true

  # Optional Settings
  # deploy.remote = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message' # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
