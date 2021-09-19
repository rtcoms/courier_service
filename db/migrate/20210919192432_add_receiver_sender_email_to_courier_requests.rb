class AddReceiverSenderEmailToCourierRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :courier_requests, :sender_email, :string
    add_column :courier_requests, :receiver_email, :string
  end
end
