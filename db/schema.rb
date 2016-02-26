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

ActiveRecord::Schema.define(version: 20160223014043) do

  create_table "admin_sets", force: true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string "slug"
    t.string "name"
    t.string "short_name"
    t.string "url"
    t.string "phone"
    t.string "email"
    t.string "ask"
  end

  create_table "licenses", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "terms",      limit: 65535
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
    t.string   "api_key"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
