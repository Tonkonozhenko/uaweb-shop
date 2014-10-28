class CreateViewedWithItems < ActiveRecord::Migration
  def change
    create_table :viewed_with_items do |t|
      t.string :session_id
      t.integer :item_id
      t.integer :viewed_id
      t.integer :count

      t.timestamps
    end
    add_index :viewed_with_items, :item_id
    add_index :viewed_with_items, :viewed_id
  end
end
