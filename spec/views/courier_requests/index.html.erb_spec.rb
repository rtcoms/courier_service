require 'rails_helper'

RSpec.describe "courier_requests/index", type: :view do
  before(:each) do
    assign(:courier_requests, [
      CourierRequest.create!(
        weight: 2,
        service_type: 3,
        cost: 4.5,
        payment_mode: 5,
        status: 6,
        sender_fullname: "Sender Fullname",
        sender_address: "MyText",
        sender_phone: "Sender Phone",
        sender_pincode: "Sender Pincode",
        receiver_fullname: "Receiver Fullname",
        receiver_address: "MyText",
        receiver_phone: "Receiver Phone",
        receiver_pincode: "Receiver Pincode",
        tracking_number: "Tracking Number"
      ),
      CourierRequest.create!(
        weight: 2,
        service_type: 3,
        cost: 4.5,
        payment_mode: 5,
        status: 6,
        sender_fullname: "Sender Fullname",
        sender_address: "MyText",
        sender_phone: "Sender Phone",
        sender_pincode: "Sender Pincode",
        receiver_fullname: "Receiver Fullname",
        receiver_address: "MyText",
        receiver_phone: "Receiver Phone",
        receiver_pincode: "Receiver Pincode",
        tracking_number: "Tracking Number"
      )
    ])
  end

  it "renders a list of courier_requests" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.5.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: "Sender Fullname".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Sender Phone".to_s, count: 2
    assert_select "tr>td", text: "Sender Pincode".to_s, count: 2
    assert_select "tr>td", text: "Receiver Fullname".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Receiver Phone".to_s, count: 2
    assert_select "tr>td", text: "Receiver Pincode".to_s, count: 2
    assert_select "tr>td", text: "Tracking Number".to_s, count: 2
  end
end
