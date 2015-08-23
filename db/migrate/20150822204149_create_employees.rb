class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :social_security_number
      t.date :hire_date
      t.date :termination_date

      t.timestamps null: false
    end
  end
end
