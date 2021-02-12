class CartsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items
  end
  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      :amount => params[:amount],
      :card => params['payjp-token'],
      :currency => 'jpy'
    )
    NotificationMailer.buy_confirm_to_user(current_user,current_cart.cart_items).deliver
    current_cart.cart_items.delete_all
  end
end
