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

ActiveRecord::Schema.define(:version => 20150531203328) do

  create_table "activities", :force => true do |t|
    t.string   "activityName"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "admins", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "cityName"
    t.string   "postalCode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "country_id"
  end

  create_table "contracts", :force => true do |t|
    t.string   "contractType"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "contactStart"
    t.datetime "contractEnd"
  end

  create_table "countries", :force => true do |t|
    t.string   "countryName"
    t.string   "postalCode"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "address"
    t.string   "username"
    t.string   "password"
    t.string   "profession"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "itemType"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "managers", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "officeName"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "real_estate_details", :force => true do |t|
    t.string   "size"
    t.string   "images"
    t.string   "realEstateType"
    t.string   "condition"
    t.string   "note"
    t.integer  "real_estate_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "real_estates", :force => true do |t|
    t.string   "realEstateType"
    t.string   "address"
    t.string   "realEstateName"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "report"
    t.datetime "reportDate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "saved_items", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "taskText"
    t.datetime "taskDate"
    t.string   "taskDuration"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.string   "roleName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "address"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
