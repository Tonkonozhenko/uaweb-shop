class Item < ActiveRecord::Base
  has_attached_file :image

  has_many :order_items
  has_many :orders, through: :order_items
end
