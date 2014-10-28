class ItemsController < ApplicationController
  inherit_resources
  actions :index, :show

  def show
    @session.view(resource)
    show!
  end

  protected
  def collection
    @projects ||= end_of_association_chain.order('id DESC')
  end
end
