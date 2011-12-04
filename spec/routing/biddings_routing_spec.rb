require "spec_helper"

describe BiddingsController do
  describe "routing" do

    it "routes to #index" do
      get("/biddings").should route_to("biddings#index")
    end

    it "routes to #new" do
      get("/biddings/new").should route_to("biddings#new")
    end

    it "routes to #show" do
      get("/biddings/1").should route_to("biddings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/biddings/1/edit").should route_to("biddings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/biddings").should route_to("biddings#create")
    end

    it "routes to #update" do
      put("/biddings/1").should route_to("biddings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/biddings/1").should route_to("biddings#destroy", :id => "1")
    end

  end
end
