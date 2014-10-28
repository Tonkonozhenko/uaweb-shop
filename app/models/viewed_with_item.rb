class ViewedWithItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :viewed, class_name: Item, foreign_key: :viewed_id
end
