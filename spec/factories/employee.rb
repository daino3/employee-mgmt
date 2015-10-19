
FactoryGirl.define do
  factory :employee do
    sequence(:first_name) { |n| "employee-first-#{n}" }
    sequence(:last_name) { |n| "employee-last-#{n}" }
    hire_date { (3.years.ago.to_date..Date.today).to_a.sample }
  end

end
