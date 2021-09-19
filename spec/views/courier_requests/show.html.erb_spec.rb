require 'rails_helper'

RSpec.describe "courier_requests/show", type: :view do
  before(:each) do
    @courier_request = assign(:courier_request, CourierRequest.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Sender Fullname/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Sender Phone/)
    expect(rendered).to match(/Sender Pincode/)
    expect(rendered).to match(/Receiver Fullname/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Receiver Phone/)
    expect(rendered).to match(/Receiver Pincode/)
    expect(rendered).to match(/Tracking Number/)
  end
end
