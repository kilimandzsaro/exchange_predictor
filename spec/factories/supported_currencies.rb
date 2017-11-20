FactoryBot.define do
  factory :supported_currency do
    currency_code { ("A".."Z").to_a.sample(3).join.to_s }
  end
end
