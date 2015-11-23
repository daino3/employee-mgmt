
FactoryGirl.define do
  factory :department do
    association :company

    before(:create) do |department|
      unless department.name.present?
        until department.valid?
          department.name = ['Marketing', 'Finance & Accounting', 'Sales', 'Human Resources','Information Technology', 'Research & Development'].sample
        end
        department.save
      end
    end
  end
end
