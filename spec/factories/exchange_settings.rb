FactoryBot.define do
  factory :exchange_setting do
    base_currency_id { ("0".."9").to_a.sample(1).join.to_i }
    target_currency_id { base_currency_id + 1 }
    period 40
    user_id { ("0".."9").to_a.sample(2).join.to_i }
  end

  factory :not_exchange_setting do
    base_currency_id "0"
    target_currency_id "0"
    period "251"
    user_id "0"
  end
end
