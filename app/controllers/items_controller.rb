class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:edit, :update]
  before_action :set_order_redirect, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
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
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    redirect_to item_path(@item) unless current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :category_id, :state_id, :barden_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @item.user_id != current_user.id || @item.order.present?
  end
end
