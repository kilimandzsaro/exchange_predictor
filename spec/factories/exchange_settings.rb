FactoryBot.define do
  factory :exchange_setting do
    base_currency_id { ("0".."9").to_a.sample(1).join.to_i }
    target_currency_id { base_currency_id + 1 }
    amount 1000
    period 40
    user_id { User.second.id }
  end

  factory :not_exchange_setting do
    base_currency_id "0"
    target_currency_id "0"
    amount 2000
    period "251"
    user_id "0"
  end
end
