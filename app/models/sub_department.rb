class SubDepartment < ActiveRecord::Base
  belongs_to :department
  has_many :positions
  has_many :employees, through: :positions
end
