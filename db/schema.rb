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

ActiveRecord::Schema.define(:version => 20171016192618) do

  create_table "NoxVault", :id => false, :force => true do |t|
    t.integer  "ID"
    t.string   "rfid"
    t.string   "name"
    t.string   "location"
    t.datetime "last"
    t.string   "state"
    t.string   "stateLast"
    t.string   "barcode"
    t.string   "make"
    t.string   "model"
    t.string   "serial_num"
    t.string   "h/r holder"
    t.string   "comments"
    t.string   "computer name"
    t.datetime "last cal"
    t.datetime "cal due"
    t.string   "acq date"
    t.string   "price $"
    t.string   "PB HR/LIN"
    t.datetime "HR signed"
  end

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "categoryName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "departmentName"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hrholders", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "rfid"
    t.integer  "dateAcquired"
    t.string   "serialNum"
    t.string   "barcode"
    t.integer  "location_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "itemstate"
    t.string   "stateLast"
    t.text     "comment"
    t.string   "computername"
    t.datetime "lastcal"
    t.datetime "caldue"
    t.string   "price"
    t.string   "pbhr"
    t.integer  "hrholder_id"
    t.date     "lastseen"
    t.date     "hrsigned"
  end

  create_table "kits", :force => true do |t|
    t.string   "kitName"
    t.integer  "item_id"
    t.text     "kitDescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "roomNum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "make_categories", :force => true do |t|
    t.integer  "make_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "makes", :force => true do |t|
    t.string   "makeName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", :force => true do |t|
    t.string   "modelName"
    t.integer  "make_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "maketemp",           :limit => 45
    t.string   "categorytemp",       :limit => 45
    t.integer  "servicelife"
  end

  create_table "profiles", :force => true do |t|
    t.string   "lastName"
    t.string   "firstName"
    t.string   "rank"
    t.integer  "department_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "roleName"
    t.text     "roleDescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.boolean  "accountedFor"
    t.boolean  "missionCapable"
    t.boolean  "beingRepaired"
    t.boolean  "beingCalibrated"
    t.boolean  "disposed"
    t.date     "dateUpdated"
    t.float    "currentValue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_has_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
