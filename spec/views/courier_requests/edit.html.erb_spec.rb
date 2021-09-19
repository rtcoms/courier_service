require 'rails_helper'

RSpec.describe "courier_requests/edit", type: :view do
  before(:each) do
    @courier_request = assign(:courier_request, CourierRequest.create!(
      weight: 1,
      service_type: 1,
      cost: 1.5,
      payment_mode: 1,
      status: 1,
      sender_fullname: "MyString",
      sender_address: "MyText",
      sender_phone: "MyString",
      sender_pincode: "MyString",
      receiver_fullname: "MyString",
      receiver_address: "MyText",
      receiver_phone: "MyString",
      receiver_pincode: "MyString",
      tracking_number: "MyString"
    ))
  end

  it "renders the edit courier_request form" do
    render

    assert_select "form[action=?][method=?]", courier_request_path(@courier_request), "post" do

      assert_select "input[name=?]", "courier_request[weight]"

      assert_select "input[name=?]", "courier_request[service_type]"

      assert_select "input[name=?]", "courier_request[cost]"

      assert_select "input[name=?]", "courier_request[payment_mode]"

      assert_select "input[name=?]", "courier_request[status]"

      assert_select "input[name=?]", "courier_request[sender_fullname]"

      assert_select "textarea[name=?]", "courier_request[sender_address]"

      assert_select "input[name=?]", "courier_request[sender_phone]"

      assert_select "input[name=?]", "courier_request[sender_pincode]"

      assert_select "input[name=?]", "courier_request[receiver_fullname]"

      assert_select "textarea[name=?]", "courier_request[receiver_address]"

      assert_select "input[name=?]", "courier_request[receiver_phone]"

      assert_select "input[name=?]", "courier_request[receiver_pincode]"

      assert_select "input[name=?]", "courier_request[tracking_number]"
    end
  end
end
