require 'rails_helper'

describe "the signin process", type: :feature, js: true do

  def fill_in_form(info)
    within(".new-employee-form") do
      fill_in 'first_name', with: info[:first_name]
      fill_in 'middle_name', with: info[:middle_name]
      fill_in 'last_name', with: info[:last_name]
    end
    if info[:hire_date].present?
      page.execute_script("$('#hire_date').datepicker('setDate', '#{info[:hire_date]}')")
      page.execute_script("$('.ui-datepicker-current-day').click()")
    end
  end

  describe 'Employee Creation' do
    context 'successful' do
      it "creates an employee" do
        visit '/employees'
        fill_in_form({first_name: 'Steve', middle_name: 'Stewart', last_name: 'Sampson', hire_date: '2013-09-10'})
        click_button 'Create Employee'
        expect(page).to have_css(".employee-table", :text => "Steve")
        expect(page).to have_css(".employee-table", :text => "Sampson")
        expect(page).to have_css(".employee-table", :text => "2013-09-10")
      end
    end

    context 'incomplete forms' do
      it 'prompts for validations before creating employees' do
        visit '/employees'
        fill_in_form({first_name: '', middle_name: '', last_name: '', hire_date: ''})
        expect {
          click_button 'Create Employee'
        }.to_not change { Employee.count }
        expect(page).to have_css(".employee-error-container", :text => "first_name - can't be blank")
        expect(page).to have_css(".employee-error-container", :text => "last_name - can't be blank")
        expect(page).to have_css(".employee-error-container", :text => "hire_date - can't be blank")
      end
    end
  end
end
