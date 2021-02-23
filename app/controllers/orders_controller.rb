class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_order, only: [:update, :show, :destroy]

  def index
    @orders = current_user.orders.all
  end

  def update
  end

  def show
    if current_user = @order.user
      @order_items = @order.order_items
    else
      redirect_to root_path, notice:'権限がありません'
    end
  end

  def destroy
    @order.destroy
  end
  private
  def order_params
    params.require(:order).permit(:quantity, :souvenir_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
