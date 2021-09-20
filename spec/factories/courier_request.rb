FactoryBot.define do
  factory(:courier_request) do
    cost { 100 }
    payment_mode { CourierRequest.payment_modes.keys.sample }
    receiver_address {"r_address"}
    receiver_fullname {"r_fullname"}
    receiver_phone {"r_phone"}
    receiver_pincode {"r_pincode"}
    sender_address {"s_address"}
    sender_fullname {"s_fullname"}
    sender_phone {"s_phone"}
    sender_pincode {"s_pincode"}
    service_type { CourierRequest.service_types.keys.sample }
    status { CourierRequest.statuses.keys.sample }
    tracking_number { 'TRCKN' }
    weight {211}

    association :user
  end
end
