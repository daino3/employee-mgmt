class EmployeeType < ActiveRecord::Base
  has_many :pay_structures
  has_many :employee_positions, through: :pay_structures
  has_many :employees, through: :pay_structures

  validates :type, inclusion: { in: %w(FullTime IndependentContractor) }
end
