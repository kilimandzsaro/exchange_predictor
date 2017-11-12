# Add the supported_currencies table
class CreateSupportedCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :supported_currencies do |t|
      t.string :currency_code

      t.timestamps
    end
    add_index :supported_currencies, :currency_code, unique: true
  end
end
