class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_order, only: [:update, :show, :destroy]

  def index
    @orders = current_user.orders.all
  end

  def update
  end

  def show
    @order_items = @order.order_items
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
