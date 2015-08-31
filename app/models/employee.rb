class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :hire_date, presence: true

  has_many :employee_positions
  has_many :sub_departments, through: :positions

  delegate :pay_structure, to: :current_position
  delegate :employee_type, to: :current_position

  def current_position
    # TODO: shouldn't use scope here
    employee_positions.active.first
  end

end
