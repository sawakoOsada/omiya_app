class CartItemsController < ApplicationController

  def create
    @cart_item = current_cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to current_cart
    else
      redirect_to souvenirs_path, notice:'しっぱいしました'
    end
  end

  def update
    @cart_item = current_cart.cart_items.find_by(souvenir_id: params[:cart_item][:souvenir_id])
    if params[:cart_item][:change_quantity]
      @cart_item.quantity = params[:cart_item][:quantity].to_i
    else
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    end
    if @cart_item.save
      redirect_to current_cart
    else
      redirect_to souvenirs_path, notice:'しっぱいしました'
    end
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by(souvenir_id: params[:id])
    @cart_item.destroy
    redirect_to current_cart
  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :souvenir_id)
  end
end
