 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/courier_requests", type: :request do
  
  # CourierRequest. As you add validations to CourierRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CourierRequest.create! valid_attributes
      get courier_requests_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      courier_request = CourierRequest.create! valid_attributes
      get courier_request_url(courier_request)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_courier_request_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      courier_request = CourierRequest.create! valid_attributes
      get edit_courier_request_url(courier_request)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CourierRequest" do
        expect {
          post courier_requests_url, params: { courier_request: valid_attributes }
        }.to change(CourierRequest, :count).by(1)
      end

      it "redirects to the created courier_request" do
        post courier_requests_url, params: { courier_request: valid_attributes }
        expect(response).to redirect_to(courier_request_url(CourierRequest.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CourierRequest" do
        expect {
          post courier_requests_url, params: { courier_request: invalid_attributes }
        }.to change(CourierRequest, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post courier_requests_url, params: { courier_request: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested courier_request" do
        courier_request = CourierRequest.create! valid_attributes
        patch courier_request_url(courier_request), params: { courier_request: new_attributes }
        courier_request.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the courier_request" do
        courier_request = CourierRequest.create! valid_attributes
        patch courier_request_url(courier_request), params: { courier_request: new_attributes }
        courier_request.reload
        expect(response).to redirect_to(courier_request_url(courier_request))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        courier_request = CourierRequest.create! valid_attributes
        patch courier_request_url(courier_request), params: { courier_request: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested courier_request" do
      courier_request = CourierRequest.create! valid_attributes
      expect {
        delete courier_request_url(courier_request)
      }.to change(CourierRequest, :count).by(-1)
    end

    it "redirects to the courier_requests list" do
      courier_request = CourierRequest.create! valid_attributes
      delete courier_request_url(courier_request)
      expect(response).to redirect_to(courier_requests_url)
    end
  end
end
