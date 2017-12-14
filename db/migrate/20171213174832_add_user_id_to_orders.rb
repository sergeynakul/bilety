class AddUserIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
    add_index :orders, [:user_id]
    add_index :orders, [:email]
    add_index :orders, [:date]
    add_index :orders, [:created_at]
  end
end
