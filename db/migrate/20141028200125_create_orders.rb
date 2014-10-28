class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :session_id
      t.string :buyer_name

      t.timestamps
    end
    add_index :orders, :session_id
  end
end
