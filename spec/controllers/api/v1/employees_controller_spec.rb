require 'rails_helper'

describe API::V1::EmployeesController do
  let(:employee) { FactoryGirl.create(:employee) }

  describe 'POST create' do
    it 'only responds to JSON' do
      post :create, format: :json
    end
  end
end
