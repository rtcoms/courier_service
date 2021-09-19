require "rails_helper"

RSpec.describe CourierRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/courier_requests").to route_to("courier_requests#index")
    end

    it "routes to #new" do
      expect(get: "/courier_requests/new").to route_to("courier_requests#new")
    end

    it "routes to #show" do
      expect(get: "/courier_requests/1").to route_to("courier_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/courier_requests/1/edit").to route_to("courier_requests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/courier_requests").to route_to("courier_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/courier_requests/1").to route_to("courier_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/courier_requests/1").to route_to("courier_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/courier_requests/1").to route_to("courier_requests#destroy", id: "1")
    end
  end
end
