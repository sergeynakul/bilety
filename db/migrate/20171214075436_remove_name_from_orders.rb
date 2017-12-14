class RemoveNameFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :name
  	remove_column :orders, :email
  end
end
