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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121223004518) do

  create_table "vehicle_inspections", :force => true do |t|
    t.boolean  "is_current",        :null => false
    t.date     "expiration_date"
    t.string   "inspection_agency"
    t.integer  "vehicle_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "vehicle_types", :force => true do |t|
    t.string   "vehicle_type_name", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.string   "state_code",   :null => false
    t.integer  "state_number", :null => false
    t.string   "plate_letter", :null => false
    t.integer  "plate_number", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
