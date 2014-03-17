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

ActiveRecord::Schema.define(version: 20140312232748) do

  create_table "beacons", force: true do |t|
    t.string   "uuid"
    t.integer  "major"
    t.integer  "minor"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "user_uid"
    t.decimal  "accuracy",   precision: 10, scale: 5
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
    t.string   "content"
    t.integer  "show_after_seconds"
    t.integer  "beacon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["beacon_id"], name: "index_items_on_beacon_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
