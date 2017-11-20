require "rails_helper"

RSpec.describe "ExchangeSettings", type: :request do
  setup do
    @es = create(:exchange_setting)
  end
  describe "GET /exchange_settings" do
    it "get the settings" do
      login_as User.find(@es.user_id)
      get exchange_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
