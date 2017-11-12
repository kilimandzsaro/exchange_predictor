# The settings contains the basic data for prediction
class ExchangeSetting < ApplicationRecord
  has_many :supported_currencies
  belongs_to :user
  validates :amount, presence: true
  validates :base_currency_id, presence: true
  validates :user_id, presence: true
  validates :period, inclusion: { in: 1..250 }, presence: true
  validates :target_currency_id, presence: true
end
