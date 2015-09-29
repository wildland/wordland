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

ActiveRecord::Schema.define(version: 20150929175355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name",             default: "",    null: false
    t.integer  "role_id"
    t.string   "permissible_type"
    t.integer  "permissible_id"
    t.boolean  "can_create",       default: false
    t.boolean  "can_read",         default: false
    t.boolean  "can_update",       default: false
    t.boolean  "can_destroy",      default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",            default: "", null: false
    t.integer  "organization_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "key",        null: false
    t.datetime "expiration"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["key"], name: "index_sessions_on_key", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                 null: false
    t.string   "email",                    null: false
    t.string   "password_digest",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_token_exp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "articles", "users"
end
