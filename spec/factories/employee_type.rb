
FactoryGirl.define do
  factory :employee_type do

    trait :full_time do
      type "FullTime"
    end

    trait :part_time do
      type "IndependentContractor"
    end
  end
end
