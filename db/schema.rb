# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_155029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "beaches", force: :cascade do |t|
    t.string "name"
    t.decimal "lat"
    t.decimal "lng"
    t.decimal "overall_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "overview"
  end

  create_table "real_time_values", force: :cascade do |t|
    t.bigint "beach_id", null: false
    t.datetime "date_time"
    t.decimal "wave_height"
    t.string "wave_direction"
    t.string "wave_formation"
    t.decimal "wind_speed"
    t.string "wind_direction"
    t.string "rain"
    t.integer "humidity"
    t.decimal "pressure"
    t.decimal "air_temperature"
    t.decimal "water_temperature"
    t.boolean "cleaning"
    t.decimal "tide"
    t.string "tide_situation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.index ["beach_id"], name: "index_real_time_values_on_beach_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weather_forecast_values", force: :cascade do |t|
    t.bigint "beach_id", null: false
    t.datetime "date_time"
    t.string "wave_direction"
    t.decimal "wave_height"
    t.integer "rain"
    t.integer "rain_probability"
    t.string "wind_direction"
    t.decimal "wind_speed"
    t.decimal "water_temperature"
    t.decimal "air_temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "wave_formation"
    t.integer "humidity"
    t.decimal "pressure"
    t.index ["beach_id"], name: "index_weather_forecast_values_on_beach_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "real_time_values", "beaches"
  add_foreign_key "weather_forecast_values", "beaches"
end
