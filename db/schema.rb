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
    t.integer "weight"
    t.integer "service_type"
    t.float "cost"
    t.integer "payment_mode"
    t.integer "status"
    t.string "sender_fullname"
    t.text "sender_address"
    t.string "sender_phone"
    t.string "sender_pincode"
    t.string "receiver_fullname"
    t.text "receiver_address"
    t.string "receiver_phone"
    t.string "receiver_pincode"
    t.string "tracking_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
