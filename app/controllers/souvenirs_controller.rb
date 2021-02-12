class SouvenirsController < ApplicationController
  def index
    @q = Souvenir.ransack(params[:q])
    @souvenirs = @q.result(distinct: true)
    @souvenirs = @souvenirs.page(params[:page]).per(10)
  end

  def show
    @souvenir = Souvenir.find(params[:id])
    @reviews = @souvenir.reviews
    @review = @souvenir.reviews.build
    item_in_cart
  end

  private
  def item_in_cart
    if current_cart.cart_items.find_by(souvenir_id: params[:id])
      @cart_item = current_cart.cart_items.find_by(souvenir_id: params[:id])
    else
      @cart_item = current_cart.cart_items.new
    end
  end
end
