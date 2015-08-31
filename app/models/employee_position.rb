class EmployeePosition < ActiveRecord::Base
  belongs_to :employee
  belongs_to :boss, class_name: 'Employee', foreign_key: 'boss_id'
  belongs_to :sub_department

  has_many :pay_structures

  validates_presence_of :start_date

  class << self
    def active
      where('start_date <= :today AND end_date IS NULL OR end_date >= :today', today: Time.zone.today)
    end
  end

  def pay_structure
    pay_structures.active.first
  end

  def employee_type
    pay_structure.employee_type
  end
end
