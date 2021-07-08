class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :days_delivery_id, :price).merge(user_id: current_user.id)
  end
end
