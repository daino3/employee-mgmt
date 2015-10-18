class MoveEmployeeIdToPayStructure < ActiveRecord::Migration
  def change
    remove_reference(:employee_positions, :employee, index: true)
    add_reference(:pay_structures, :employee, index: true)
  end
end
