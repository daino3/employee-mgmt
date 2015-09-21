
require "capybara-webkit"
require 'capybara-screenshot/rspec'

# take screenshots on failure
Capybara::Screenshot.autosave_on_failure = true
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.debug = false
  config.allow_unknown_urls
  config.timeout = 3
end
