class NotificationMailer < ApplicationMailer
  def buy_confirm_to_user(user, order)
    @user = user
    @address = @user.addresses.first
    @order = order
    @items = order.order_items
    mail(
      subject: "ご注文の確認",
      to: @user.email
    ) do |format|
      format.html
    end
  end

  def sent_confirm_to_user(order)
    @order = order
    @user = @order.user
    @address = @user.addresses.first
    @items = order.order_items
    mail(
      subject: "商品発送のお知らせ",
      to: @user.email
    ) do |format|
      format.html
    end
  end

  def arrived_confirm_to_user(order)
    @order = order
    @user = @order.user
    @address = @user.addresses.first
    @items = order.order_items
    mail(
      subject: "商品発送のお知らせ",
      to: @user.email
    ) do |format|
      format.html
    end
  end
end
