require "rails_helper"

RSpec.describe ExchangeSetting, type: :model do
  setup do
    @exchange_setting = FactoryBot.create(:exchange_setting)
  end

  it "is filled with valid period" do
    expect(ExchangeSetting.new(@exchange_setting)).to be_valid
  end
  it "is filled with invalid period" do
    expect(ExchangeSetting.new(period: 251)).to_not be_valid
  end
end
