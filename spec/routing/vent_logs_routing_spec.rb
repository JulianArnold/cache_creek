require "rails_helper"

RSpec.describe VentLogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vent_logs").to route_to("vent_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/vent_logs/new").to route_to("vent_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/vent_logs/1").to route_to("vent_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vent_logs/1/edit").to route_to("vent_logs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vent_logs").to route_to("vent_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vent_logs/1").to route_to("vent_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vent_logs/1").to route_to("vent_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vent_logs/1").to route_to("vent_logs#destroy", :id => "1")
    end

  end
end
