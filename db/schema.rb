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

ActiveRecord::Schema.define(:version => 20110305205653) do

  create_table "capability_building_blocks", :force => true do |t|
    t.string   "cbb_title"
    t.text     "cbb_definition"
    t.integer  "category_id"
    t.text     "level_1_cbb"
    t.text     "level_2_cbb"
    t.text     "level_3_cbb"
    t.text     "level_4_cbb"
    t.text     "level_5_cbb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "category_title"
    t.integer  "critical_process_id"
    t.text     "level_1_category"
    t.text     "level_2_category"
    t.text     "level_3_category"
    t.text     "level_4_category"
    t.text     "level_5_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "critical_processes", :force => true do |t|
    t.integer  "cp_secondary_id"
    t.string   "cp_title"
    t.text     "cp_intro"
    t.text     "cp_definition"
    t.text     "in_scope"
    t.text     "out_scope"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "critical_processes_key_terms", :id => false, :force => true do |t|
    t.integer "critical_process_id"
    t.integer "key_term_id"
  end

  create_table "key_terms", :force => true do |t|
    t.string   "term"
    t.text     "meaning"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "lesson_title"
    t.text     "lesson_definition"
    t.integer  "critical_process_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "critical_process_id"
    t.boolean  "edit"
    t.boolean  "review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
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
    t.string   "user_name"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

end
