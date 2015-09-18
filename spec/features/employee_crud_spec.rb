require 'rails_helper'

describe "the signin process", type: :feature, js: true do

  it "signs me in" do
    visit '/employees'
    within(".new-employee-form") do
      fill_in 'first_name', with: 'Steve'
      fill_in 'middle_name', with: 'Stewart'
      fill_in 'last_name', with: 'Sampson'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
