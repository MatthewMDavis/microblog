source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'

# Translate bootstrap's LESS framework to SCSS
gem 'bootstrap-sass', '2.3.2.0'

# paginate data queries
gem 'will_paginate'
gem 'bootstrap-will_paginate'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18.3'
gem 'faker'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.1.1'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.0.4'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.3.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.0'

# Use puma as the app server
gem 'puma'

group :development do
  gem 'awesome_print'
  gem 'pry-rails' 
end

group :development, :test do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails', '~> 3.0'
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta3'
end

group :test do
  gem 'capybara',           '~> 2.2.0'
  gem 'factory_girl_rails', "~> 4.5.0"
  gem 'selenium-webdriver', "2.47.1"
  gem 'guard-rspec'
  gem 'growl',              "1.0.3"
end
group :test, :darwin do
  gem 'rb-fsevent'
end
group :production do
  gem 'rails_12factor', '0.0.2'
end

# gem 'cucumber-rails', group: :test

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
