require "rails_helper"

RSpec.describe "SiteLayouts", type: :request do
  describe "GET /site_layouts" do
    user = FactoryBot.create(:user)
    user.confirm!

    it "gets new user page" do
      get new_user_path
      expect(response).to have_http_status(200)
    end
    it "gets edit user page" do
      sign_in user
      get edit_user_path
      expect(response).to have_http_status(200)
    end
    it "gets user's page" do
      sign_in user
      get_user_path
      expect(response).to have_http_status(200)
    end
    it "gets the root page" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
