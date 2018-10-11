class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def email_receipt(current_user, order)
    @order = order
    @current_user = current_user
    mail(to: @current_user.email, subject: "Order Id: #{@order.id}")
  end
end
