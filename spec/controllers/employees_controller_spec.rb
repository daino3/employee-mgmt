require 'rails_helper'

describe EmployeesController do
  include GonHelpers

  let(:sub_department) { FactoryGirl.create(:sub_department) }
  let(:position) { FactoryGirl.create(:employee_position, sub_department: sub_department) }
  let(:pay_structure) { FactoryGirl.create(:pay_structure, :part_time, employee_position: position) }
  let!(:employee) { FactoryGirl.create(:employee, pay_structures: [pay_structure]) }

  render_views

  describe 'GET index' do
    subject { get :index }

    it { should render_template('employees/index') }

    it 'should serialize employees' do
      get :index

      should_set_gon(response.body, :departments)
      expect(response).to be_successful
      expect(assigns[:departments].count).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'does some stuff', :focus do
      get :show, id: employee.id

      should_set_gon(response.body, :employee)
      expect(response).to be_successful
      expect(assigns[:employee]).to eq(employee)
    end
  end
end
