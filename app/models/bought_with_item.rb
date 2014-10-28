class BoughtWithItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :bought, class_name: Item, foreign_key: :bought_id
end
