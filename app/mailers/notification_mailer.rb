class NotificationMailer < ApplicationMailer
  def buy_confirm_to_user(user,items)
    @user = user
    @items = items
    mail(
      subject: "ご注文の確認",
      to: @user.email
    ) do |format|
      format.text
    end
  end
end
