class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_order, only: [:show, :destroy]

  def index
    @orders = current_user.orders.all
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
    redirect_to orders_path, notice:'注文をキャンセルしました'
  end
  private
  def order_params
    params.require(:order).permit(:quantity, :souvenir_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
