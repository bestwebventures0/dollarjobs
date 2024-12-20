source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '~> 6.1.0'
## UPGRADE RAILS TO 7.0
# gem 'rails', '~> 7.0.0'
## UPGRADE RAILS TO 8.0
gem 'rails', '~> 8.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '>= 2.1'
# Use Puma as the app server
gem 'puma', '>= 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'spring', '~> 4.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  # gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

## App specific gems
gem 'annotate' #, '~> 3.2.0'
gem 'activeadmin' #, '~> 3.0'
gem 'devise' #, '~> 4.8.1'
gem 'image_processing'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
# gem 'trix', github: 'DRBragg/trix'
# Our Payment Engine
gem 'razorpay'
# figaro
gem 'figaro'
# sitemap generator
gem 'sitemap_generator'
# whenever gem for CRON jobs
gem 'whenever', require: false
# social sharing
gem 'social-share-button'

## blog
gem "webrick"
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem 'jekyll', '~> 3.10'
# This is the default theme for new Jekyll sites. You may change this to anything you like.
gem "minima", "~> 2.0"
# jekyll sitemaps
gem 'jekyll-sitemap'

## UPGRADE TO RAILS 7.0.0
gem "colorize", "~> 1.1"
gem 'rexml', '~> 3.2', '>= 3.2.4'
gem "rack", "~> 2.2"
gem "sprockets", "~> 4.2"
gem 'psych', '< 4'
gem "kramdown-parser-gfm", "~> 1.1"
gem "jekyll-feed", "~> 0.11.0"
gem "jekyll-seo-tag", "~> 2.6"
