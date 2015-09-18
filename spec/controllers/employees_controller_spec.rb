require 'rails_helper'

describe EmployeesController do
  include GonHelpers

  let(:sub_department) { FactoryGirl.create(:sub_department) }
  let(:position) { FactoryGirl.create(:employee_position, sub_department: sub_department) }
  let!(:employee) { FactoryGirl.create(:employee).employee_positions << position }

  render_views

  describe 'GET index', :focus do
    subject { get :index }
    it { should render_template('employees/index') }

    it 'should serialize employees' do
      get :index

      should_set_gon(response.body, :employees)
      expect(response).to be_successful
      expect(assigns[:employees].count).to eq(1)
    end
  end
end
