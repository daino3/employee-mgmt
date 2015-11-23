
FactoryGirl.define do
  factory :pay_structure do

    trait :full_time do
      start_date { Time.zone.now }
      employee_type { FactoryGirl.create(:employee_type, :full_time) }
      salary 80_000
    end

    trait :part_time do
      start_date { Time.zone.now }
      employee_type { FactoryGirl.create(:employee_type, :part_time) }
      hourly_rate 25
    end
  end
end
