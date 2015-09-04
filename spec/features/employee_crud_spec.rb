require 'rails_helper'

describe "the signin process", type: :feature, js: true do

  it "signs me in" do
    visit '/employees'
    binding.pry
    within("#session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
