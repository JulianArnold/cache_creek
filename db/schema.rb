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

ActiveRecord::Schema.define(version: 20180625204415) do

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "curriculum_vitaes", ["user_id"], name: "index_curriculum_vitaes_on_user_id"

  create_table "opportunities", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "person_id"
    t.string   "job_title"
    t.text     "job_description"
    t.string   "category"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id"

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.text     "postal_address"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "organisations", ["user_id"], name: "index_organisations_on_user_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "organisation_id"
    t.string   "linkedin_profile_url"
    t.date     "next_contact_on"
    t.string   "source_of_contact"
    t.date     "cv_sent_on"
    t.string   "cv_version"
    t.string   "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "locale",                          default: "en"
    t.string   "country_code"
    t.string   "mobile_number"
    t.datetime "email_permission_granted_at"
    t.datetime "sms_permission_granted_at"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_token_sent_at"
    t.integer  "login_count",                     default: 0,     null: false
    t.integer  "failed_login_count",              default: 0,     null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",                          default: false
    t.boolean  "approved",                        default: false
    t.boolean  "confirmed",                       default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "account_activation_code"
    t.datetime "account_activation_code_sent_at"
  end

  add_index "users", ["account_activation_code"], name: "index_users_on_account_activation_code"
  add_index "users", ["email"], name: "index_users_on_email"

end
