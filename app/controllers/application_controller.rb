class ApplicationController < ActionController::Base
  helper_method :current_cart
  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id])
    current_cart = Cart.create unless current_cart
    session[:cart_id] = current_cart.id
    current_cart
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
