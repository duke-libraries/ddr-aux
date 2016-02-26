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

  create_table "admin_sets", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "slug",       limit: 255
    t.string "name",       limit: 255
    t.string "short_name", limit: 255
    t.string "url",        limit: 255
    t.string "phone",      limit: 255
    t.string "email",      limit: 255
    t.string "ask",        limit: 255
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "url",        limit: 255
    t.text     "terms",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255
    t.string   "email",              limit: 255, default: "",    null: false
    t.string   "encrypted_password", limit: 255, default: "",    null: false
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.string   "display_name",       limit: 255
    t.string   "nickname",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                          default: false
    t.string   "api_key",            limit: 255
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
