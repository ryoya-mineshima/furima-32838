class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
    #@items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
