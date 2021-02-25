class SouvenirsController < ApplicationController

  def new
    @souvenir = Souvenir.new
  end

  def create
    @souvenir = Souvenir.new(souvenir_params)
    if @souvenir.save
      redirect_to souvenirs_path, notice:'作成しました'
    else
      render :new
    end
  end

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
    user_buy_this?
  end

  private
  def souvenir_params
    params.require(:souvenir).permit(:name, :image, :image_cache, :price, :prefecture_id)
  end

  def item_in_cart
    if current_cart.cart_items.find_by(souvenir_id: params[:id])
      @cart_item = current_cart.cart_items.find_by(souvenir_id: params[:id])
    else
      @cart_item = current_cart.cart_items.new
    end
  end

  def user_buy_this?
    @review_ok = false
    if current_user.present?
      current_user.orders.each do |order|
        order.order_items.each do |item|
          if item.souvenir.id == @souvenir.id
            @review_ok = true
            break
          end
        end
      end
    end
  end
end
