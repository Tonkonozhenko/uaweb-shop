class OrdersController < ApplicationController
  respond_to :html, :json

  before_filter except: [:index] do
    @cart = @session.cart
  end

  def index
    @orders = @session.orders
  end

  def new

  end

  def cart

  end

  def create
    buyer_name = params[:order][:buyer_name]
    if buyer_name.present? && @cart.buy(buyer_name: buyer_name)
      render 'orders/success'
    else
      render 'orders/fail'
    end
  end

  def add_to_cart
    item_id = params[:item_id]
    item = Item.find(item_id)

    order_item = @cart.order_items.where(item_id: item_id).first
    if order_item
      order_item.update_attributes(count: order_item.count + 1)
    else
      @cart.add(item)
      @cart.items << item
      @cart.save
    end

    respond_to do |format|
      format.json do

      end
      format.html do
        redirect_to request.referer
      end
    end
  end

  def inc
    oi = @cart.order_items.find(params[:order_item_id])
    oi.update_attributes(count: oi.count + 1) if oi
    redirect_to cart_path
  end

  def dec
    oi = @cart.order_items.find(params[:order_item_id])
    if oi
      if oi.count > 1
        oi.update_attributes(count: oi.count - 1)
      else
        oi.destroy
      end
    end
    redirect_to cart_path
  end

  def del
    oi = @cart.order_items.find(params[:order_item_id])
    oi.destroy if oi
    redirect_to cart_path
  end
end