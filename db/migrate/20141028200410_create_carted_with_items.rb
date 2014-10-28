class CreateCartedWithItems < ActiveRecord::Migration
  def change
    create_table :carted_with_items do |t|
      t.string :session_id
      t.integer :item_id
      t.integer :carted_id
      t.integer :count

      t.timestamps
    end
    add_index :carted_with_items, :item_id
    add_index :carted_with_items, :carted_id
  end
end
