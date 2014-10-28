class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def price
    each_price * count
  end
end
