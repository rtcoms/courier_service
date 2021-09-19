class CreateCourierRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :courier_requests do |t|
      t.integer :weight, null: false
      t.integer :service_type, default: 1
      t.float :cost, null: false
      t.integer :payment_mode, default: 1, null: false
      t.integer :status, default: 1, null: false
      t.string :sender_fullname, null: false
      t.text :sender_address, null: false
      t.string :sender_phone, null: false
      t.string :sender_pincode, null: false
      t.string :receiver_fullname, null: false
      t.text :receiver_address, null: false
      t.string :receiver_phone, null: false
      t.string :receiver_pincode, null: false
      t.string :tracking_number, null: false

      t.timestamps
    end
  end
end
