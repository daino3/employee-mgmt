Given(/^I visit the home page$/) do
  visit '/'
end

Given(/^I click "(.*?)"$/) do |button|
  click_on button
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |form_field, value|
  fill_in form_field, with:  value
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(1 == 2).to be true
end

Then(/^I should see the following employees:$/) do |table|
end
