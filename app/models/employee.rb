class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :hire_date, presence: true

  has_many :pay_structures
  has_many :employee_positions, through: :pay_structures
  has_many :employee_types, through: :pay_structures

  delegate :pay_structure, to: :current_position
  delegate :employee_type, to: :current_position

  def current_position
    # TODO: shouldn't use scope here
    current_pay.employee_position
  end

  def department
    current_position.department.presence || sub_department.department
  end

  def sub_department
    current_position.sub_department
  end

  def current_pay
    pay_structures.active.first
  end

end
