require 'rails_helper'
require 'rake'


describe "populate:company rake task" do

  before(:all) do
    Rake.application.rake_require "tasks/populate_company"
    Rake::Task.define_task(:environment)
  end

  let(:run_task) do
    Rake::Task["populate:company"].reenable
    Rake::Task["populate:company"].invoke
  end

  it 'seeds the dev env with departments' do
    expect { run_task }.to change { Department.count }.by 6

    expect(Department.find_by(name: 'Marketing')).to be_present
    expect(Department.find_by(name: 'Finance')).to be_present
  end

  it 'seeds the dev env with employee types' do
    expect { run_task }.to change { EmployeeType.count }.by 2

    expect(EmployeeType.find_by(type: 'IndependentContractor')).to be_present
    expect(EmployeeType.find_by(type: 'FullTime')).to be_present
  end

  it 'seeds the dev env with sub departments', :focus do
    expect { run_task }.to change { SubDepartment.count }

    expect(Department.find_by(name: 'Marketing').sub_departments.count).to be > 0
    expect(Department.find_by(name: 'Finance').sub_departments.count).to be > 0
  end

end
