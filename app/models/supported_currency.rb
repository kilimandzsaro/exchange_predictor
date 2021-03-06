# Supported currencies, only the application user
# can extend this list (or a DB admin)
class SupportedCurrency < ApplicationRecord
  has_many :exchange_setting
  validates :currency_code, uniqueness: true, format: {
    with: /[A-Z]{3}/,
    message: "Only valid currency codes allowed"
  }
end
