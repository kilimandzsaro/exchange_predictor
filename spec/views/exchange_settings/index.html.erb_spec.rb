require "rails_helper"

RSpec.describe "exchange_settings/index", type: :view do
  before(:each) do
    @es1 = create(:exchange_setting)
    @es2 = create(:exchange_setting)
  end

  it "renders a list of exchange_settings" do
    render
  end
end
