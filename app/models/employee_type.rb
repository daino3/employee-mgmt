class EmployeeType < ActiveRecord::Base
  has_many :pay_structures
  has_many :positions, through: :pay_structures

  validates :type, inclusion: { in: %w(W-2 1099) }
end
