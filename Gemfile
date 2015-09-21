source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'pg'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# rails
gem 'active_model_serializers', git: 'git@github.com:rails-api/active_model_serializers.git'
gem "responders"

# markup
gem 'foundation-rails'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'

# javascript
gem 'angular_rails_csrf'
gem 'angularjs-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'gon'
gem 'jquery-rails'
gem 'jquery-ui-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'underscore-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
#

group :development, :test do
  gem 'faker'
  gem 'jasmine-rails'
  gem 'pry-byebug'
  gem 'spring'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem "capybara-webkit"
  gem 'capybara-screenshot'
  gem 'connection_pool'
  gem 'database_cleaner'
  gem 'factory_girl_rails', :require => false
  gem 'poltergeist'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
end

