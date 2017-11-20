require "rails_helper"

RSpec.describe SupportedCurrency, type: :model do
  it "is filled with valid currency format" do
    expect(SupportedCurrency.new(currency_code: "XXX")).to be_valid
  end
  it "is n ot accepting a not valid currency format" do
    currencies = ["xxx", "something", "AAc", "111", ""]
    currencies.each do |currency|
      c = SupportedCurrency.new(currency_code: currency)
      expect(c).to_not be_valid
    end
  end
end
