# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151018185134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_positions", force: :cascade do |t|
    t.integer  "sub_department_id"
    t.integer  "boss_id"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "employee_positions", ["boss_id"], name: "index_employee_positions_on_boss_id", using: :btree
  add_index "employee_positions", ["sub_department_id"], name: "index_employee_positions_on_sub_department_id", using: :btree

  create_table "employee_types", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "social_security_number"
    t.date     "hire_date"
    t.date     "termination_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pay_structures", force: :cascade do |t|
    t.integer  "employee_position_id"
    t.integer  "employee_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "employee_id"
  end

  add_index "pay_structures", ["employee_id"], name: "index_pay_structures_on_employee_id", using: :btree
  add_index "pay_structures", ["employee_position_id"], name: "index_pay_structures_on_employee_position_id", using: :btree
  add_index "pay_structures", ["employee_type_id"], name: "index_pay_structures_on_employee_type_id", using: :btree

  create_table "sub_departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sub_departments", ["department_id"], name: "index_sub_departments_on_department_id", using: :btree

end
