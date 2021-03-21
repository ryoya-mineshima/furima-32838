class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_path, only: [:edit, :update,]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path 
    else
      render :edit
    end
  end

  def destroy
    if current_user.id = @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end 

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_path
    redirect_to root_path if current_user.id != @item.user_id
    end
  end
