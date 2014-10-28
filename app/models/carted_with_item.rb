class CartedWithItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :carted, class_name: Item, foreign_key: :carted_id
end
