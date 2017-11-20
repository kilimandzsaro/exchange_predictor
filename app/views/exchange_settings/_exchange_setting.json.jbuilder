json.extract! exchange_setting,
              :id,
              :user_id,
              :base_currency,
              :target_currency,
              :period,
              :created_at,
              :updated_at
json.url exchange_setting_url(exchange_setting, format: :json)
