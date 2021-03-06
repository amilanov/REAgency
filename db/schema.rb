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

ActiveRecord::Schema.define(:version => 20170412153737) do

  create_table "activities", :force => true do |t|
    t.string   "activityName"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "activityType"
    t.integer  "user_id"
    t.integer  "for_user_id"
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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "contactStart"
    t.datetime "contractEnd"
    t.string   "contractName"
    t.integer  "user_id"
    t.integer  "real_estate_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "countryName"
    t.string   "postalCode"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "contract_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "activity_id"
  end

  create_table "offices", :force => true do |t|
    t.string   "officeName"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "real_estate_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["real_estate_id"], :name => "index_pictures_on_real_estate_id"

  create_table "real_estate_details", :force => true do |t|
    t.string   "size"
    t.string   "realEstateType"
    t.string   "condition"
    t.string   "note"
    t.integer  "real_estate_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "address"
    t.string   "description"
    t.string   "price"
    t.string   "num_of_rooms"
    t.string   "num_of_balconies"
    t.string   "num_of_bathrooms"
    t.string   "floor"
    t.string   "heating_system"
    t.string   "orientation"
    t.string   "windows"
    t.string   "year_of_manufacture"
    t.string   "aircondition"
    t.string   "elevator"
    t.string   "pantry"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "real_estate_types", :force => true do |t|
    t.string   "realEstateType"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "real_estates", :force => true do |t|
    t.string   "realEstateName"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "city_id"
    t.integer  "user_id"
    t.integer  "real_estate_type_id"
    t.boolean  "finished"
  end

  add_index "real_estates", ["city_id"], :name => "index_real_estates_on_city_id"
  add_index "real_estates", ["user_id"], :name => "index_real_estates_on_user_id"

  create_table "reports", :force => true do |t|
    t.string   "report"
    t.datetime "reportDate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "roleName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "saved_real_estates", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "real_estate_id"
  end

  create_table "tasks", :force => true do |t|
    t.string   "taskText"
    t.datetime "taskDate"
    t.string   "taskDuration"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "role_id"
  end

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "address"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
