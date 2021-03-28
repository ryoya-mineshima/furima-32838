class PurchaseRecordController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new 
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.purchase_record.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(purchase_record_params) 
    @item = Item.find(params[:item_id])
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

end
