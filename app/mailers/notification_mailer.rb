class NotificationMailer < ApplicationMailer
  def buy_confirm_to_user(user, order)
    @user = user
    @address = @user.addresses.first
    @items = order.order_items
    mail(
      subject: "ご注文の確認",
      to: @user.email
    ) do |format|
      format.html
    end
  end
end
