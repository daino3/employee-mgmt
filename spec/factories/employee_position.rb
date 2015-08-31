
FactoryGirl.define do
  factory :employee_position do
    association :employee
    association :sub_department
    association :boss, factory: :employee
  end
end
