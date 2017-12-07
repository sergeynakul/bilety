class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :from
      t.string :to
      t.date   :date

      t.timestamps
    end
  end
end