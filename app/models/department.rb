class Department < ActiveRecord::Base
  belongs_to :company
  has_many :sub_departments
  has_one :department_head, class_name: 'EmployeePosition', foreign_key: 'department_id'

  validates_uniqueness_of :name
  validates :company_id, :name, presence: true

  class << self
  end

  def employees
    sub_ids = sub_departments.pluck(:id)
    pos_ids = EmployeePosition.where(id: sub_ids << self.id).pluck(:id)
    emp_ids = PayStructure.where(id: pos_ids).pluck(:employee_id)
    Employee.where(id: emp_ids)
  end

  def employee_positions
    EmployeePosition.joins(:sub_department).where(sub_department: sub_departments.pluck(:id))
  end
end
