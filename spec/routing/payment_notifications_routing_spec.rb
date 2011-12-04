require "spec_helper"

describe PaymentNotificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/payment_notifications").should route_to("payment_notifications#index")
    end

    it "routes to #new" do
      get("/payment_notifications/new").should route_to("payment_notifications#new")
    end

    it "routes to #show" do
      get("/payment_notifications/1").should route_to("payment_notifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payment_notifications/1/edit").should route_to("payment_notifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payment_notifications").should route_to("payment_notifications#create")
    end

    it "routes to #update" do
      put("/payment_notifications/1").should route_to("payment_notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payment_notifications/1").should route_to("payment_notifications#destroy", :id => "1")
    end

  end
end
