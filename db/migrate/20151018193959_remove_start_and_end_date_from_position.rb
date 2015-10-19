class RemoveStartAndEndDateFromPosition < ActiveRecord::Migration
  def up
    remove_column :employee_positions,:start_date
    remove_column :employee_positions,:end_date
  end


  def down
    add_column :employee_positions, :start_date, :string
    add_column :employee_positions, :end_date, :string
  end
end
