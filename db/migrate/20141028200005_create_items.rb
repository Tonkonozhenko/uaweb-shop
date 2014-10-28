class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.attachment :image
      t.text :description
      t.integer :price
      t.integer :views, default: 0
      t.hstore :bought_with_this, default: {}
      t.hstore :carted_with_this, default: {}
      t.hstore :viewed_with_this, default: {}

      t.timestamps
    end
  end
end
