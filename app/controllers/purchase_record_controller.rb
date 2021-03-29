class PurchaseRecordController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_path, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(purchase_record_params) 
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_record_params
    params.require(:order_address).permit(
      :post_cord,
      :prefecture_id, 
      :city, 
      :address, 
      :building, 
      :phone_number, 
      :purchase_record
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_path
    if current_user == @item.user || @item.purchase_record.present?
      redirect_to root_path
    end
  end

end
