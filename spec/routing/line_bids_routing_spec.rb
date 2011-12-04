require "spec_helper"

describe LineBidsController do
  describe "routing" do

    it "routes to #index" do
      get("/line_bids").should route_to("line_bids#index")
    end

    it "routes to #new" do
      get("/line_bids/new").should route_to("line_bids#new")
    end

    it "routes to #show" do
      get("/line_bids/1").should route_to("line_bids#show", :id => "1")
    end

    it "routes to #edit" do
      get("/line_bids/1/edit").should route_to("line_bids#edit", :id => "1")
    end

    it "routes to #create" do
      post("/line_bids").should route_to("line_bids#create")
    end

    it "routes to #update" do
      put("/line_bids/1").should route_to("line_bids#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/line_bids/1").should route_to("line_bids#destroy", :id => "1")
    end

  end
end
