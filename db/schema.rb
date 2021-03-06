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

ActiveRecord::Schema.define(version: 20170422055424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.index ["floor_id"], name: "index_areas_on_floor_id", using: :btree
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.string   "socket_address"
    t.integer  "socket_port"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_buildings_on_user_id", using: :btree
  end

  create_table "cam_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "cam_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "device_category_id"
    t.integer  "control_type"
    t.index ["cam_type"], name: "index_cam_categories_on_cam_type", unique: true, using: :btree
    t.index ["device_category_id"], name: "index_cam_categories_on_device_category_id", using: :btree
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
    t.integer  "position"
    t.index ["device_id"], name: "index_cams_on_device_id", using: :btree
  end

  create_table "device_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "device_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["device_type"], name: "index_device_categories_on_device_type", unique: true, using: :btree
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "i_type"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.index ["area_id"], name: "index_devices_on_area_id", using: :btree
  end

  create_table "floors", force: :cascade do |t|
    t.string   "name"
    t.string   "image_name"
    t.integer  "building_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position"
    t.index ["building_id"], name: "index_floors_on_building_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "areas", "floors"
  add_foreign_key "buildings", "users"
  add_foreign_key "cam_categories", "device_categories"
  add_foreign_key "cams", "devices"
  add_foreign_key "devices", "areas"
  add_foreign_key "floors", "buildings"
end
