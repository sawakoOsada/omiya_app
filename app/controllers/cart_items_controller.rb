class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:edit, :update, :destroy]

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to current_cart
    else
      redirect_to souvenir_path(params[:souvenir_id])
    end
  end

  def update
    @cart_item.update(cart_item_params)
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end
  private
  def set_cart_item
    @cart_item = current_cart.cart_items.find_by(souvenir_id: params[:souvenir_id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
