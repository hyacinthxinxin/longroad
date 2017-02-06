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

ActiveRecord::Schema.define(version: 20170206072754) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_areas_on_floor_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.string   "socket_address"
    t.integer  "socket_port"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_buildings_on_user_id"
  end

  create_table "cams", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "i_type"
    t.integer  "control_type"
    t.string   "control_address"
    t.string   "status_address"
    t.integer  "control_value"
    t.integer  "status_value"
    t.integer  "min_control_value"
    t.integer  "max_control_value"
    t.integer  "min_status_value"
    t.integer  "max_status_value"
    t.integer  "device_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["device_id"], name: "index_cams_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "i_type"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_devices_on_area_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "building_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["building_id"], name: "index_floors_on_building_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
