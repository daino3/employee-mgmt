
FactoryGirl.define do
  factory :employee do
    sequence(:first_name) { |n| "employee-first-#{n}" }
    sequence(:last_name) { |n| "employee-last-#{n}" }
  end
end
