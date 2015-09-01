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

ActiveRecord::Schema.define(version: 20150901144422) do

  create_table "licenses", force: true do |t|
    t.string "code"
    t.string "title"
    t.string "url"
    t.text   "terms", limit: 65535
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "phone"
    t.string   "email"
    t.string   "url"
    t.string   "ask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",              default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",              default: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
