
FactoryGirl.define do
  factory :pay_structure do
    association :employee_position
    association :employee_type
  end
end
