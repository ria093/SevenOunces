source 'https://rubygems.org'
ruby '2.1.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', '~> 1.1.3',        group: :development

# Use Bootstrap
gem 'bootstrap-sass', '~> 3.2.0'

# Use Yelp API
# See https://github.com/Yelp/yelp-ruby
gem 'yelp', '~> 2.0.3'

# Use to connect to yummly API
gem 'faraday', '~> 0.9.0'

# environmental variable configuration
gem 'dotenv-rails', groups: [:development, :test]

# Server monitoring
gem 'newrelic_rpm', '~> 3.9.4'

group :development do
  # sqlite3 for ActiveRecord
  gem 'sqlite3', '~> 1.3.9'
end

group :production do
  # PG for ActiveRecord
  gem 'pg', '~> 0.17.1'

  # Caching base
  gem 'dalli', '~> 2.7.2'

  # Caching with memcache
  gem 'memcachier', '~> 0.0.2'

  # Heroku 12 factor app
  # For details: http://12factor.net/
  gem 'rails_12factor', '~> 0.0.2'

  # Production Webserver
  gem 'unicorn', '~> 4.8.3'
end
