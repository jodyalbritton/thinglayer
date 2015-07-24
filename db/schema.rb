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

ActiveRecord::Schema.define(version: 20150717095917) do

  create_table "events", force: :cascade do |t|
    t.string   "date",       limit: 255
    t.string   "device",     limit: 255
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.integer  "thing_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question",   limit: 255
    t.text     "answer",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     limit: 4
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "subject",    limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.string   "token",      limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",   limit: 255
  end

  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "things", force: :cascade do |t|
    t.string   "label",         limit: 255
    t.string   "device_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",       limit: 4
    t.string   "ancestry",      limit: 255
    t.string   "uid",           limit: 255
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.string   "provider",      limit: 255
    t.boolean  "visible",       limit: 1,     default: true
    t.integer  "zone_id",       limit: 4
    t.integer  "zone_position", limit: 4
    t.integer  "position",      limit: 4
    t.boolean  "indoor",        limit: 1,     default: true
  end

  add_index "things", ["ancestry"], name: "index_things_on_ancestry", using: :btree
  add_index "things", ["user_id"], name: "index_things_on_user_id", using: :btree
  add_index "things", ["zone_id"], name: "index_things_on_zone_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.string   "full_name",              limit: 255
    t.string   "time_zone",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "ancestry",    limit: 255
    t.text     "description", limit: 65535
    t.integer  "location_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
