require 'rails_helper'

describe EmployeesController do
  include GonHelpers

  let!(:employee) { FactoryGirl.create(:employee) }
  render_views

  describe 'GET index' do
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
