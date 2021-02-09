class OrdersController < ApplicationController
before_action :set_order, only: [:index, :create]
  def index
    @order_furima = OrderFurima.new
  end

  def create
    @order_furima = OrderFurima.new(furima_params)
    if @order_furima.valid?
      @order_furima.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def furima_params
    params.require(:order_furima).permit(:postal_code, :area_id, :municipalty, :adress, :building, :phone_number).merge(user_id: current_user.id)
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
