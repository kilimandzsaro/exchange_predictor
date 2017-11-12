require "rails_helper"

RSpec.describe ExchangeSettingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/exchange_settings").to route_to("exchange_settings#index")
    end

    it "routes to #new" do
      expect(get: "/exchange_settings/new").to route_to("exchange_settings#new")
    end

    it "routes to #edit" do
      expect(get: "/exchange_settings/1/edit").to route_to("exchange_settings#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/exchange_settings").to route_to("exchange_settings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/exchange_settings/1").to route_to("exchange_settings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/exchange_settings/1").to route_to("exchange_settings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/exchange_settings/1").to route_to("exchange_settings#destroy", id: "1")
    end
  end
end
