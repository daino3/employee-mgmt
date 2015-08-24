require 'rails_helper'

describe EmployeeSerializer do
  let(:attributes) { [:first_name, :id, :last_name, :hire_date, :termination_date] }

  it 'has the right attributes' do
    expect(EmployeeSerializer._attributes - attributes).to be_empty
  end
end
