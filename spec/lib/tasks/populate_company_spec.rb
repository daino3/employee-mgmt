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

  it 'seeds the dev env with sub departments' do
    expect { run_task }.to change { SubDepartment.count }

    expect(Department.find_by(name: 'Marketing').sub_departments.count).to be > 0
    expect(Department.find_by(name: 'Finance').sub_departments.count).to be > 0
  end

  it 'seeds the dev env with employees' do
    expect { run_task }.to change { Employee.count }.by 10
  end

  it 'seeds the dev env with employee positions' do
    expect { run_task }.to change { EmployeePosition.count }.by 7

    expect(EmployeePosition.find_by(title: 'CEO')).to be_present
    expect(EmployeePosition.find_by(title: 'CTO')).to be_present
    expect(EmployeePosition.find_by(title: 'Software Developer')).to be_present
    expect(Department.find_by(name: 'Marketing').department_head).to be_an EmployeePosition
    expect(Department.find_by(name: 'Finance').department_head).to be_an EmployeePosition
  end

  it 'populates executive employee positions with pay structures and employees' do
    expect { run_task }.to change { PayStructure.count }.by 10

    expect(EmployeePosition.find_by(title: 'Software Developer').employees.count).to eq 3
    expect(EmployeePosition.find_by(title: 'Marketing Analyst').employees.count).to eq 2
    expect(EmployeePosition.find_by(title: 'Business Analyst').employees.count).to eq 1
  end

  it 'associates an EmployeePosition with a boss' do
    run_task

    expect(EmployeePosition.find_by(title: 'Software Developer').boss.title).to eq 'CTO'
    expect(EmployeePosition.find_by(title: 'Marketing Analyst').boss.title).to eq 'CMO'
    expect(EmployeePosition.find_by(title: 'Business Analyst').boss.title).to eq 'CFO'
  end

  it 'can be run twice without changing anything' do
    run_task

    expect { run_task }.to_not change { Employee.count }
  end

end
