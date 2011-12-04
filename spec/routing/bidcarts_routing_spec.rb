require "spec_helper"

describe BidcartsController do
  describe "routing" do

    it "routes to #index" do
      get("/bidcarts").should route_to("bidcarts#index")
    end

    it "routes to #new" do
      get("/bidcarts/new").should route_to("bidcarts#new")
    end

    it "routes to #show" do
      get("/bidcarts/1").should route_to("bidcarts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bidcarts/1/edit").should route_to("bidcarts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bidcarts").should route_to("bidcarts#create")
    end

    it "routes to #update" do
      put("/bidcarts/1").should route_to("bidcarts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bidcarts/1").should route_to("bidcarts#destroy", :id => "1")
    end

  end
end
