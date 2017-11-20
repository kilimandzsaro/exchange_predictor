# Add the exchange settings table
class CreateExchangeSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_settings do |t|
      t.references :user, foreign_key: true
      t.integer :base_currency_id
      t.integer :target_currency_id
      t.decimal :amount
      t.integer :period
      t.timestamps
    end
  end
end
