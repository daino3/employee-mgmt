class PayStructure < ActiveRecord::Base
  belongs_to :employee_position
  belongs_to :employee
  belongs_to :employee_type

  validates :start_date,
            :employee_position_id,
            :employee_type_id,
            presence: true

  validates :salary, presence: true, if: Proc.new { |struct| struct.full_time? }
  validates :hourly_rate, presence: true, if: Proc.new { |struct| struct.contractor? }

  class << self
    def active
      where('start_date <= :today AND end_date IS NULL OR end_date >= :today', today: Time.zone.today)
    end
  end

  def full_time?
    employee_type.try(:type) == 'FullTime'
  end

  def contractor?
    employee_type.try(:type) == 'IndependentContractor'
  end

end
