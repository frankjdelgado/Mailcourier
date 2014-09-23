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

ActiveRecord::Schema.define(version: 20140923050136) do

  create_table "agencies", force: true do |t|
    t.string "location"
  end

  create_table "package_relationships", force: true do |t|
    t.integer "user_id"
    t.integer "package_id"
    t.boolean "sender"
  end

  add_index "package_relationships", ["package_id"], name: "index_package_relationships_on_package_id", using: :btree
  add_index "package_relationships", ["user_id"], name: "index_package_relationships_on_user_id", using: :btree

  create_table "packages", force: true do |t|
    t.text     "description"
    t.float    "weight",                     null: false
    t.float    "height",                     null: false
    t.float    "depth",                      null: false
    t.float    "value",                      null: false
    t.integer  "status",         default: 0
    t.integer  "agency_id"
    t.datetime "date_added",                 null: false
    t.datetime "date_arrived"
    t.datetime "date_delivered"
    t.string   "ref_number"
    t.float    "shipping_cost"
    t.float    "width",                      null: false
  end

  add_index "packages", ["agency_id"], name: "index_packages_on_agency_id", using: :btree

  create_table "packages_users", force: true do |t|
    t.integer "user_id"
    t.integer "package_id"
    t.boolean "sender"
  end

  add_index "packages_users", ["package_id"], name: "index_packages_users_on_package_id", using: :btree
  add_index "packages_users", ["user_id"], name: "index_packages_users_on_user_id", using: :btree

  create_table "rates", force: true do |t|
    t.float    "package"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                            null: false
    t.integer  "role",                   default: 0
    t.integer  "agency_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["agency_id"], name: "index_users_on_agency_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
