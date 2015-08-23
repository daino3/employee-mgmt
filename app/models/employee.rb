class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :hire_date, presence: true

end
