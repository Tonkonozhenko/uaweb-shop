class Order < ActiveRecord::Base
  has_many :order_items, autosave: true
  has_many :items, through: :order_items

  scope :carts, -> { where(buyer_name: nil) }
  scope :orders, -> { where.not(buyer_name: nil) }

  def add(item)
    items.each do |i|
      i.inc_carted(item.id)
      item.inc_carted(i.id)
      i.save
    end
    item.save
  end

  def buy(opts ={})
    transaction do
      assign_attributes(opts)
      order_items.each { |oi| oi.each_price = oi.item.price }
      save

      items.each do |i|
        items.each do |j|
          i.inc_bought(j.id) unless i == j
        end
        i.save
      end
    end
  end

  def price
    order_items.map(&:price).inject(&:+)
  end
end
