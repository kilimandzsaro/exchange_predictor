# Supported currencies, only the application user
# can extend this list (or a DB admin)
class SupportedCurrency < ApplicationRecord
  validates :currency_code, uniqueness: true
end
