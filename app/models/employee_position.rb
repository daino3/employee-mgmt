class EmployeePosition < ActiveRecord::Base
  belongs_to :boss, class_name: 'EmployeePosition', foreign_key: 'boss_id'
  belongs_to :sub_department
  belongs_to :department

  has_many :pay_structures
  has_many :employees, through: :pay_structures
  has_many :employee_types, through: :pay_structures

  class << self
  end

  def employee
    raise "Not Implemented on Sub Department position" unless department_id.present?
    pay_structures.active.first.employee
  end

  def employees
    pay_structures.active.flat_map(&:employee)
  end

end
