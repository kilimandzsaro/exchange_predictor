class AddNameToUsersTable < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :name, :string, null: false, default: ""
  end

  def self.down
    remove_column :users, :name, :string
  end
end
