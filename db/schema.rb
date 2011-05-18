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

ActiveRecord::Schema.define(:version => 20110516095632) do

  create_table "admin_admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_admins", ["email"], :name => "index_admin_admins_on_email", :unique => true
  add_index "admin_admins", ["reset_password_token"], :name => "index_admin_admins_on_reset_password_token", :unique => true
  add_index "admin_admins", ["unlock_token"], :name => "index_admin_admins_on_unlock_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "description"
    t.string   "heading"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.string   "names_depth_cache"
    t.integer  "ancestry_depth",    :default => 0
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "photos", :force => true do |t|
    t.integer  "category_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "measures"
    t.integer  "category_id", :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
