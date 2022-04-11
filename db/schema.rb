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

ActiveRecord::Schema[7.0].define(version: 2022_04_11_213015) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.boolean "active"
    t.string "location"
    t.string "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_modes", force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_statuses", force: :cascade do |t|
    t.bigint "payment_mode_id", null: false
    t.string "payment_detail"
    t.float "amount"
    t.string "uuid"
    t.bigint "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_mode_id"], name: "index_payment_statuses_on_payment_mode_id"
  end

  create_table "pricing_details", force: :cascade do |t|
    t.float "base_price"
    t.float "additional_amount"
    t.integer "discount_type"
    t.string "tax_class"
    t.float "vat_amount"
    t.bigint "title_id", null: false
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_pricing_details_on_title_id"
  end

  create_table "state_transitions", force: :cascade do |t|
    t.string "item_type"
    t.bigint "item_id"
    t.string "comment"
    t.string "from"
    t.string "to"
    t.string "uuid"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_state_transitions_on_user_id"
  end

  create_table "status_masters", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "active"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "block_no"
    t.string "pincode"
    t.string "village"
    t.string "taluka"
    t.string "description"
    t.bigint "status_id"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_titles_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "employee_code"
    t.string "first_name"
    t.string "last_name"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "payment_statuses", "payment_modes"
  add_foreign_key "pricing_details", "titles"
  add_foreign_key "state_transitions", "users"
  add_foreign_key "titles", "clients"
end
