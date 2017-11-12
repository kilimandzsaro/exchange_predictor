require "rails_helper"

RSpec.describe "exchange_settings/new", type: :view do
  before(:each) do
    assign(:exchange_setting, create(:exchange_setting))
  end

  it "renders new exchange_setting form" do
    render

    assert_select "form[action=?][method=?]", exchange_settings_path, "post" do
    end
  end
end
