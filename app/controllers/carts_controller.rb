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
    end
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
