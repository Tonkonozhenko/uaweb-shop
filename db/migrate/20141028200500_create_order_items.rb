class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :count, default: 1
      t.integer :each_price, default: 0

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :item_id
  end
end
