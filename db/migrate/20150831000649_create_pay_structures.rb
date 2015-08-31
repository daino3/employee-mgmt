class CreatePayStructures < ActiveRecord::Migration
  def change
    create_table :pay_structures do |t|
      t.belongs_to :employee_position, index: true
      t.belongs_to :employee_type, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
