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

ActiveRecord::Schema.define(:version => 20140819174157) do

  create_table "issues", :force => true do |t|
    t.integer  "project_id"
    t.integer  "milestone_id"
    t.string   "title",                :null => false
    t.text     "description"
    t.text     "acceptence_criteria"
    t.string   "issue_type"
    t.integer  "assigned_to"
    t.integer  "estimate"
    t.integer  "percentage_completed"
    t.integer  "created_by"
    t.datetime "start_date"
    t.datetime "closed_date"
    t.string   "priority"
    t.string   "status"
    t.string   "code",                 :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "issues", ["code"], :name => "index_issues_on_code", :unique => true
  add_index "issues", ["title"], :name => "index_issues_on_title"

  create_table "milestones", :force => true do |t|
    t.integer  "project_id"
    t.string   "name",        :null => false
    t.string   "status"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "project_roles", :force => true do |t|
    t.integer  "project_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "project_role_id"
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title",       :default => "", :null => false
    t.text     "description"
    t.string   "code",        :default => "", :null => false
    t.string   "user_id",                     :null => false
    t.string   "status"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "projects", ["code"], :name => "index_projects_on_code", :unique => true
  add_index "projects", ["title"], :name => "index_projects_on_title"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",               :default => "",    :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.boolean  "is_admin",               :default => false
    t.string   "primary_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "fax"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
