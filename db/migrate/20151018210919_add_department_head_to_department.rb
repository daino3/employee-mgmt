class AddDepartmentHeadToDepartment < ActiveRecord::Migration
  def change
    add_reference :employee_positions, :department, index: true
  end
end
