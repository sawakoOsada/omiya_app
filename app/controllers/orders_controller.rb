class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_order, only: [:show, :destroy]

  def index
    if current_user.seller?
      @orders = Order.all
    else
      @orders = current_user.orders.all
    end
  end

  def show
    if current_user = @order.user
      @order_items = @order.order_items
    else
      redirect_to root_path, notice:'権限がありません'
    end
  end

  def update
    params[:order][:state] = params[:order][:state].to_i
    @order = Order.find(params[:id])
    if @order.update(order_params)
      NotificationMailer.sent_confirm_to_user(@order).deliver if params[:order][:state] == 1
      NotificationMailer.arrived_confirm_to_user(@order).deliver if params[:order][:state] == 2
      redirect_to orders_path, notice:'変更しました'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice:'注文をキャンセルしました'
  end
  private
  def order_params
    params.require(:order).permit(:state, :id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
