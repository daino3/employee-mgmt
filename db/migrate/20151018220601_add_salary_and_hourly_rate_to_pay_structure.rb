class AddSalaryAndHourlyRateToPayStructure < ActiveRecord::Migration
  def change
    add_column :pay_structures, :salary, :integer
    add_column :pay_structures, :hourly_rate, :decimal, scale: 2, precision: 10
  end
end
