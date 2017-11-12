require "rails_helper"

RSpec.describe "ExchangeSettings", type: :request do
  before(:each) do
    @es = create(:exchange_setting)
  end
  describe "GET /exchange_settings" do
    it "works! (now write some real specs)" do
      login_as @es
      get exchange_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
