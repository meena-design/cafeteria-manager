class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :delivered_at
      t.string :order_status

      t.timestamps
    end
  end
end
