# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_29_042429) do

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "pitch_booking_services", charset: "utf8mb4", force: :cascade do |t|
    t.integer "number"
    t.bigint "pitch_booking_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pitch_booking_id"], name: "index_pitch_booking_services_on_pitch_booking_id"
    t.index ["service_id"], name: "index_pitch_booking_services_on_service_id"
  end

  create_table "pitch_bookings", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "time_start"
    t.datetime "time_end"
    t.bigint "total_price"
    t.integer "status"
    t.text "des"
    t.string "phone"
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "pitch_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pitch_id"], name: "index_pitch_bookings_on_pitch_id"
    t.index ["user_id"], name: "index_pitch_bookings_on_user_id"
  end

  create_table "pitches", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "pitch_type"
    t.integer "rate"
    t.bigint "hour_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", charset: "utf8mb4", force: :cascade do |t|
    t.integer "rate"
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "pitch_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pitch_id"], name: "index_reviews_on_pitch_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "services", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.bigint "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.integer "role", default: 0
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "pitch_booking_services", "pitch_bookings"
  add_foreign_key "pitch_booking_services", "services"
  add_foreign_key "pitch_bookings", "pitches"
  add_foreign_key "pitch_bookings", "users"
  add_foreign_key "reviews", "pitches"
  add_foreign_key "reviews", "users"
end
