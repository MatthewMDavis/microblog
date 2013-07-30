source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Translate bootstrap's LESS framework to SCSS
gem 'bootstrap-sass', '2.3.2.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use puma as the app server
gem 'puma'
gem 'guard-puma'

group :development do
  gem 'awesome_print'
  gem 'pry-rails' 
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'childprocess'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
	gem 'guard-spork'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'selenium-webdriver'
end

# gem 'cucumber-rails', group: :test

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
