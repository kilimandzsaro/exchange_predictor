require "rails_helper"

RSpec.describe "SiteLayouts", type: :request do
  setup do
    @user = create(:user)
  end
  describe "GET /site_layouts" do
    it "gets new user page" do
      get new_user_path
      expect(response).to have_http_status(200)
    end
    it "gets edit user page" do
      login_as @user
      get edit_user_path(@user.id)
      expect(response).to have_http_status(200)
    end
    it "gets user's page" do
      login_as @user
      get user_path(@user.id)
      expect(response).to have_http_status(200)
    end
    it "gets the root page" do
      get root_path
      expect(response).to have_http_status(200)
    end
    it "get the exchange settings page" do
      get exchange_settings_path
      expect(response).to have_http_status(302)
    end
  end
end
