class OrdersController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  before_action :set_redirect, only: [:index, :create]
  def index
    @order_furima = OrderFurima.new
  end

  def create
    @order_furima = OrderFurima.new(furima_params)
    if @order_furima.valid?
      pay_item
      @order_furima.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def furima_params
    params.require(:order_furima).permit(:postal_code, :area_id, :municipalty, :adress, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item[:price],  
        card: furima_params[:token],    
        currency: 'jpy'                
    )
  end

  def set_redirect
    redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end
end
