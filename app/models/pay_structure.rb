class PayStructure < ActiveRecord::Base
  belongs_to :employee_position
  belongs_to :employee_type

  class << self
    def active
      where('start_date <= :today AND end_date IS NULL OR end_date >= :today', today: Time.zone.today)
    end
  end

end
