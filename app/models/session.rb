class Session < ActiveRecord::Base
  has_one :cart, -> { carts }, class_name: Order
  has_many :orders, -> { orders }, class_name: Order

  after_initialize do
    cart.presence || build_cart
  end

  def view(item)
    transaction do
      # viewed - items viewed in this session
      if viewed.length > 0 && viewed.index(item.id).nil?
        # mark all viewed that they are viewed with new item
        Item.find(viewed).each do |i|
          i.inc_viewed(item.id)
          i.save

          # mark that new item is viewed with this item
          item.inc_viewed(i.id)
        end

        item.save
      end

      # save that current items viewed in this session
      if viewed.index(item.id).nil?
        item.view!
        viewed << item.id
        viewed_will_change!
        save
      end
    end
  end

  def bought?(item)
    @bought_item_ids = orders.map { |o| o.item_ids }.flatten.index(item.id)
  end

  def carted?(item)
    @carted_item_ids = cart.item_ids.index(item.id)
  end
end
