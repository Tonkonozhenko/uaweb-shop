class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  after_initialize do
    self.each_price = item.price if each_price == 0 && item
  end

  def price
    each_price * count
  end
end
