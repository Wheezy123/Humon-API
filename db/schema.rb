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

ActiveRecord::Schema.define(version: 20140713235459) do

  create_table "attendances", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["event_id", "user_id"], name: "index_attendances_on_event_id_and_user_id", unique: true

  create_table "events", force: true do |t|
    t.datetime "ended_at"
    t.string   "name",       null: false
    t.integer  "place_id",   null: false
    t.datetime "started_at"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "lon"
    t.string   "address"
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "users", force: true do |t|
    t.string   "facebook_id"
    t.string   "first_name"
    t.string   "image_url"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_token"
  end

  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id"

end
