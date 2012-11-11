require "spec_helper"

describe ImgsController do
  describe "routing" do

    it "routes to #index" do
      get("/imgs").should route_to("imgs#index")
    end

    it "routes to #new" do
      get("/imgs/new").should route_to("imgs#new")
    end

    it "routes to #show" do
      get("/imgs/1").should route_to("imgs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/imgs/1/edit").should route_to("imgs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/imgs").should route_to("imgs#create")
    end

    it "routes to #update" do
      put("/imgs/1").should route_to("imgs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/imgs/1").should route_to("imgs#destroy", :id => "1")
    end

  end
end
