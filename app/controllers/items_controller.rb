class ItemsController < ApplicationController
  inherit_resources
  actions :show

  def index
    @items = Item.order('id DESC').sort_by { |i| [@session.bought?(i) ? 0 : 1, @session.carted?(i) ? 1 : 0, -i.views] }
  end
  
  def show
    @session.view(resource)
  end
end
