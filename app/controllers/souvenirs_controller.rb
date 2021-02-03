class SouvenirsController < ApplicationController
  def index
    @q = Souvenir.ransack(params[:q])
    @souvenirs = @q.result(distinct: true)
  end

  def show
    @souvenir = Souvenir.find(params[:id])
    @reviews = @souvenir.reviews
    @review = @souvenir.reviews.build
    # @cart_item = current_cart.cart_items.find_by(souvenir_id: params[:souvenir_id])
  end
end
