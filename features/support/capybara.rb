require 'capybara/poltergeist'

# Capybara.register_driver :poltergeist_debug do |app|
#   Capybara::Poltergeist::Driver.new(app, :inspector => true)
# end
# Capybara.javascript_driver = :poltergeist_debug

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {})
end

Capybara.javascript_driver = :poltergeist

# Capybara.default_driver = :poltergeist

After do |scenario|
  save_screenshot(Rails.root.join('tmp/cucumber/failure.png')) if scenario.failed?
end
