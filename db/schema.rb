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

ActiveRecord::Schema.define(version: 20141028033624) do

  create_table "apps", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apps", ["user_id"], name: "index_apps_on_user_id", using: :btree

  create_table "beacon_devices", force: true do |t|
    t.integer  "user_id"
    t.integer  "beacon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beacon_devices", ["beacon_id"], name: "index_beacon_devices_on_beacon_id", using: :btree
  add_index "beacon_devices", ["user_id"], name: "index_beacon_devices_on_user_id", using: :btree

  create_table "beacons", force: true do |t|
    t.string   "uuid"
    t.integer  "major"
    t.integer  "minor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
    t.string   "location"
  end

  add_index "beacons", ["uuid", "major", "minor"], name: "index_beacons_on_uuid_and_major_and_minor", unique: true, using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "detections", force: true do |t|
    t.integer  "beacon_id"
    t.integer  "user_uid",   limit: 8
    t.decimal  "accuracy",             precision: 10, scale: 5
    t.integer  "proximity"
    t.integer  "rssi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detections", ["beacon_id"], name: "index_detections_on_beacon_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "spec"
    t.string   "name"
    t.string   "description"
    t.text     "content"
    t.integer  "show_after_seconds"
    t.integer  "beacon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["beacon_id"], name: "index_items_on_beacon_id", using: :btree

  create_table "notifications", force: true do |t|
    t.string   "device_id"
    t.string   "os"
    t.integer  "beacon_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["beacon_id"], name: "index_notifications_on_beacon_id", using: :btree

  create_table "template_photos", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "photolink"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_image_1"
  end

  add_index "template_photos", ["item_id"], name: "index_template_photos_on_item_id", using: :btree

  create_table "template_wines", force: true do |t|
    t.string   "name"
    t.text     "taste_notes"
    t.string   "wine_specs_vintage",           default: "0.0"
    t.float    "wine_specs_sugar",             default: 0.0
    t.string   "wine_specs_appellation",       default: "0.0"
    t.float    "wine_specs_acid",              default: 0.0
    t.float    "wine_specs_alcohol",           default: 0.0
    t.float    "wine_specs_ph",                default: 0.0
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_link"
    t.string   "wine_specs_price_description"
    t.string   "url_image_1"
    t.string   "room_type"
    t.string   "price"
    t.integer  "sort_column"
  end

  add_index "template_wines", ["item_id"], name: "index_template_wines_on_item_id", using: :btree

  create_table "templates", force: true do |t|
    t.string   "name"
    t.text     "description_1"
    t.text     "description_2"
    t.string   "photo_link_1",  limit: 500
    t.string   "photo_link_2",  limit: 500
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_image_1"
    t.string   "url_image_2"
  end

  add_index "templates", ["item_id"], name: "index_templates_on_item_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "uid"
    t.string   "device_id"
    t.string   "os"
  end

  add_index "users", ["email", "first_name", "last_name"], name: "index_users_on_email_and_first_name_and_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
