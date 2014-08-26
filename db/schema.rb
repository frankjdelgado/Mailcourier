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

ActiveRecord::Schema.define(version: 20140826052452) do

  create_table "agencies", force: true do |t|
    t.text "ubication", null: false
  end

  create_table "packages", force: true do |t|
    t.text     "description"
    t.float    "weight",                     null: false
    t.float    "height",                     null: false
    t.float    "depth",                      null: false
    t.float    "value",                      null: false
    t.integer  "status",         default: 0
    t.datetime "date_added",                 null: false
    t.datetime "date_arrived"
    t.datetime "date_delivered"
    t.integer  "destiny"
    t.integer  "sender"
    t.integer  "receiver"
  end

  add_index "packages", ["destiny"], name: "index_packages_on_destiny", using: :btree
  add_index "packages", ["receiver"], name: "index_packages_on_receiver", using: :btree
  add_index "packages", ["sender"], name: "index_packages_on_sender", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "password",               null: false
    t.integer  "role",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
