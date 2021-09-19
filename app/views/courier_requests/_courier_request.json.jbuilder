json.extract! courier_request, :id, :weight, :service_type, :cost, :payment_mode, :status, :sender_fullname, :sender_address, :sender_phone, :sender_pincode, :receiver_fullname, :receiver_address, :receiver_phone, :receiver_pincode, :tracking_number, :created_at, :updated_at
json.url courier_request_url(courier_request, format: :json)
