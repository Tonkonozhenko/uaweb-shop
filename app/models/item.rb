class Item < ActiveRecord::Base
  has_attached_file :image

  COUNT = 10

  has_many :order_items
  has_many :orders, through: :order_items

  def inc_viewed(id)
    id = id.to_s
    views = viewed_with_this[id].to_i
    viewed_with_this[id] = views + 1
    viewed_with_this_will_change!
  end

  def inc_bought(id)
    id = id.to_s
    buyes = bought_with_this[id].to_i
    bought_with_this[id] = buyes + 1
    bought_with_this_will_change!
  end

  def inc_carted(id)
    id = id.to_s
    carts = carted_with_this[id].to_i
    carted_with_this[id] = carts + 1
    carted_with_this_will_change!
  end

  # -------

  def items_bought_with
    @items_bought_with =
        if @items_bought_with
          @items_bought_with
        else
          ids = bought_with_this.sort_by(&:last).map(&:first).reverse[0...COUNT].map(&:to_i)
          ids += (Item.pluck(:id) - ids).sample(COUNT - ids.length) if ids.length < COUNT
          Item.find(ids)
        end
  end

  def items_viewed_with
    @items_viewed_with =
        if @items_viewed_with
          @items_viewed_with
        else
          ids = viewed_with_this.sort_by(&:last).map(&:first).reverse[0...COUNT].map(&:to_i)
          ids += (Item.pluck(:id) - ids).sample(COUNT - ids.length) if ids.length < COUNT
          Item.find(ids)
        end
  end

  def items_carted_with
    @items_carted_with =
        if @items_carted_with
          @items_carted_with
        else
          ids = carted_with_this.sort_by(&:last).map(&:first).reverse[0...COUNT].map(&:to_i)
          ids += (Item.pluck(:id) - ids).sample(COUNT - ids.length) if ids.length < COUNT
          Item.find(ids)
        end
  end
end
