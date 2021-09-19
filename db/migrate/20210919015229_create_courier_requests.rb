class CreateCourierRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :courier_requests do |t|
      t.integer :weight
      t.integer :service_type
      t.float :cost
      t.integer :payment_mode
      t.integer :status
      t.string :sender_fullname
      t.text :sender_address
      t.string :sender_phone
      t.string :sender_pincode
      t.string :receiver_fullname
      t.text :receiver_address
      t.string :receiver_phone
      t.string :receiver_pincode
      t.string :tracking_number

      t.timestamps
    end
  end
end
