class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:pay]

  def show
    @cart_items = current_cart.cart_items
  end

  def confirm
    if current_user.nil?
      redirect_to new_user_registration_path, notice:'商品購入には会員登録が必要です'
    elsif current_user.addresses.blank?
      redirect_to edit_user_registration_path, notice:'商品購入には住所情報が必要です'
    else
      @cart_items = current_cart.cart_items
      @addresses = current_user.addresses
      render :confirm
    end
  end

  def pay
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # Payjp::Charge.create(
    #   :amount => params[:amount],
    #   :card => params['payjp-token'],
    #   :currency => 'jpy'
    # )
    @cart_items = current_cart.cart_items
    order_create(@cart_items)
    NotificationMailer.buy_confirm_to_user(current_user, @order).deliver
    @cart_items.delete_all
  end
  private
  def order_create(items)
    @order = current_user.orders.build
    items.each do |item|
      @order_item = @order.order_items.build
      @order_item.souvenir_id = item.souvenir_id
      @order_item.quantity = item.quantity
      @order_item.save
    end
    @order.save
  end
end
