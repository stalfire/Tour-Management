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

ActiveRecord::Schema.define(version: 20180306054806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "records", force: :cascade do |t|
    t.string   "purpose"
    t.string   "description"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "mode"
    t.integer  "cost"
    t.integer  "home_city_price"
    t.integer  "destination_city_price"
    t.integer  "hotel_price"
    t.string   "local_transport"
    t.integer  "user_id"
    t.integer  "manager_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "status",                 default: "draft"
    t.integer  "to_finance",             default: 0
    t.index ["user_id"], name: "index_records_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "token"
    t.integer "role",            default: 0
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "records", "users"
end
