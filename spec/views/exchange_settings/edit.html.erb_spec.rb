require "rails_helper"

RSpec.describe "exchange_settings/edit", type: :view do
  before(:each) do
    @exchange_setting = create(:exchange_setting)
  end

  it "renders the edit exchange_setting form" do
    render

    assert_select "form[action=?][method=?]", exchange_setting_path(@exchange_setting), "post" do
    end
  end
end
