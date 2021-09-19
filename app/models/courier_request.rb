class CourierRequest < ApplicationRecord
  validates :weight, :cost, :status, :payment_mode, :service_type,
            :sender_fullname, :sender_address, :sender_phone, :sender_pincode,
            :receiver_fullname, :receiver_address, :receiver_phone, :receiver_pincode,
            :tracking_number,
            presence: true
end
