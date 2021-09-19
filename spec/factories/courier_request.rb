FactoryGirl.define do
  factory(:courier_request) do
    cost nil
    payment_mode nil
    receiver_address ""
    receiver_fullname ""
    receiver_phone ""
    receiver_pincode ""
    sender_address ""
    sender_fullname ""
    sender_phone ""
    sender_pincode ""
    service_type nil
    status nil
    tracking_number ""
    weight nil
  end
end
