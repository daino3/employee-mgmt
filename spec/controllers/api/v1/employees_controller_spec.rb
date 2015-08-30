require 'rails_helper'

describe Api::V1::EmployeesController do
  let(:employee) { FactoryGirl.build(:employee) }

  describe 'POST create' do
    it 'creates an employee with valid params' do
      expect {
        post :create, employee: employee.as_json, format: :json
      }.to change { Employee.count }.by(1)

      expect(response).to be_successful
    end

    it 'returns the json of the created employee' do
      post :create, employee: employee.as_json, format: :json

      expect(JSON.parse(response.body)['first_name']).to eq(employee.first_name)
    end

    it 'returns a list of errors when the record is invalid' do
      expect {
        post :create, employee: {first_name: 'steve'}, format: :json
      }.to_not change { Employee.count }

      response_body = JSON.parse(response.body)
      expect(response_body['errors']['last_name']).to be_present
      expect(response_body['errors']['hire_date']).to be_present
    end
  end
end
