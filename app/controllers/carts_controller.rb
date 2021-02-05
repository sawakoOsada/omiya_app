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
  end
end
