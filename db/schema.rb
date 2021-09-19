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

ActiveRecord::Schema.define(version: 2021_09_19_015229) do

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
  end

end
