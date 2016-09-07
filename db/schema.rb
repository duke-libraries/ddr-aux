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

ActiveRecord::Schema.define(version: 20160907151209) do

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

  create_table "duracloud_audit_log_entries", id: false, force: :cascade do |t|
    t.string   "account"
    t.string   "store_id"
    t.string   "space_id"
    t.string   "content_id"
    t.string   "content_md5"
    t.integer  "content_size"
    t.string   "content_mimetype"
    t.text     "content_properties"
    t.string   "space_acls"
    t.string   "source_space_id"
    t.string   "source_content_id"
    t.datetime "timestamp"
    t.string   "action"
    t.string   "username"
  end

  add_index "duracloud_audit_log_entries", ["account"], name: "index_duracloud_audit_log_entries_on_account"
  add_index "duracloud_audit_log_entries", ["action"], name: "index_duracloud_audit_log_entries_on_action"
  add_index "duracloud_audit_log_entries", ["content_id"], name: "index_duracloud_audit_log_entries_on_content_id"
  add_index "duracloud_audit_log_entries", ["content_mimetype"], name: "index_duracloud_audit_log_entries_on_content_mimetype"
  add_index "duracloud_audit_log_entries", ["content_size"], name: "index_duracloud_audit_log_entries_on_content_size"
  add_index "duracloud_audit_log_entries", ["space_id"], name: "index_duracloud_audit_log_entries_on_space_id"
  add_index "duracloud_audit_log_entries", ["store_id"], name: "index_duracloud_audit_log_entries_on_store_id"
  add_index "duracloud_audit_log_entries", ["username"], name: "index_duracloud_audit_log_entries_on_username"

  create_table "duracloud_bit_integrity_checks", id: false, force: :cascade do |t|
    t.datetime "date_checked"
    t.string   "account"
    t.string   "store_id"
    t.string   "store_type"
    t.string   "space_id"
    t.string   "content_id"
    t.string   "result"
    t.string   "content_checksum"
    t.string   "provider_checksum"
    t.string   "manifest_checksum"
    t.string   "details"
  end

  add_index "duracloud_bit_integrity_checks", ["account"], name: "index_duracloud_bit_integrity_checks_on_account"
  add_index "duracloud_bit_integrity_checks", ["content_id"], name: "index_duracloud_bit_integrity_checks_on_content_id"
  add_index "duracloud_bit_integrity_checks", ["date_checked"], name: "index_duracloud_bit_integrity_checks_on_date_checked"
  add_index "duracloud_bit_integrity_checks", ["result"], name: "index_duracloud_bit_integrity_checks_on_result"
  add_index "duracloud_bit_integrity_checks", ["space_id"], name: "index_duracloud_bit_integrity_checks_on_space_id"
  add_index "duracloud_bit_integrity_checks", ["store_id"], name: "index_duracloud_bit_integrity_checks_on_store_id"

  create_table "duracloud_manifest_entries", id: false, force: :cascade do |t|
    t.string "space_id"
    t.string "content_id"
    t.string "md5"
  end

  add_index "duracloud_manifest_entries", ["content_id"], name: "index_duracloud_manifest_entries_on_content_id"
  add_index "duracloud_manifest_entries", ["space_id"], name: "index_duracloud_manifest_entries_on_space_id"

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
