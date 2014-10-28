class CreateBoughtWithItems < ActiveRecord::Migration
  def change
    create_table :bought_with_items do |t|
      t.string :session_id
      t.integer :item_id
      t.integer :bought_id
      t.integer :count

      t.timestamps
    end
    add_index :bought_with_items, :item_id
    add_index :bought_with_items, :bought_id
  end
end
