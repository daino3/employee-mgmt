class CreateSubDepartments < ActiveRecord::Migration
  def change
    create_table :sub_departments do |t|
      t.string :name
      t.belongs_to :department, index: true

      t.timestamps null: false
    end
  end
end
