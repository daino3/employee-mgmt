class CreateEmployeePositions < ActiveRecord::Migration
  def change
    create_table :employee_positions do |t|
      t.belongs_to :sub_department, index: true
      t.belongs_to :employee, index: true
      t.belongs_to :boss, index: true
      t.string :title
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
