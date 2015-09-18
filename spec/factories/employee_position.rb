
FactoryGirl.define do
  factory :employee_position do
    association :employee
    association :boss, factory: :employee
    association :sub_department
    start_date {Time.zone.today}
  end
end
