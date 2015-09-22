class Department < ActiveRecord::Base
  has_many :sub_departments

  validates_uniqueness_of :name

  class << self
  end

  def employees
    sub_ids = sub_departments.pluck(:id)
    pos_ids = EmployeePosition.where(id: sub_ids).pluck(:employee_id)
    Employee.where(id: pos_ids)
  end
end
