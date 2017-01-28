source 'https://rubygems.org'

require 'rbconfig'

if RbConfig::CONFIG['target_os'] =~ /(?i-mx:bsd|dragonfly)/
  gem 'rb-kqueue', '>= 0.2'
end

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]

gem 'rack-contrib'
gem 'mime-types'

gem "middleman"
gem "middleman-blog"
gem 'middleman-livereload'
gem 'middleman-syntax'
gem 'middleman-minify-html'
gem 'middleman-sprockets'
gem 'middleman-s3_sync'
gem 'middleman-autoprefixer'

gem "builder"
gem 'nokogiri', '1.6.8'

gem "jquery-middleman"
gem 'bootstrap-sass'
gem 'font-awesome-sass'

gem "puma", :group => :production
