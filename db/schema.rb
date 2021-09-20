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

ActiveRecord::Schema.define(version: 2021_09_20_200137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courier_requests", force: :cascade do |t|
    t.integer "weight", null: false
    t.integer "service_type", default: 1
    t.float "cost", null: false
    t.integer "payment_mode", default: 1, null: false
    t.integer "status", default: 1, null: false
    t.string "sender_fullname", null: false
    t.text "sender_address", null: false
    t.string "sender_phone", null: false
    t.string "sender_pincode", null: false
    t.string "receiver_fullname", null: false
    t.text "receiver_address", null: false
    t.string "receiver_phone", null: false
    t.string "receiver_pincode", null: false
    t.string "tracking_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sender_email"
    t.string "receiver_email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
