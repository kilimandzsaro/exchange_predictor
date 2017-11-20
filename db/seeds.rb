if User.find_by_email("admin@admin.com").nil? && !Rails.env.production?
  User.create!(email: "admin@admin.com", password: "Iamveryadmin")
  User.create!(email: "user@user.com", password: "Iamveryuser")
end

currency_codes = [:AUD, :BGN, :BRL, :CAD, :CHF, :CNY, :CZK, :DKK, :EUR,
                  :GBP, :HKD, :HRK, :HUF, :IDR, :ILS, :INR, :JPY, :KRW,
                  :MXN, :MYR, :NOK, :NZD, :PHP, :PLN, :RON, :RUB, :SEK,
                  :SGD, :THB, :TRY, :USD, :ZAR]
currency_codes.each do |currency_code|
  SupportedCurrency.create!(currency_code: currency_code)
end

ExchangeSetting.create!(user_id: User.second.id,
                        base_currency_id: SupportedCurrency.first.id,
                        target_currency_id: SupportedCurrency.second.id,
                        amount: "1000",
                        period: "12")
