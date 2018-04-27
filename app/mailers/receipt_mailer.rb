class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def receipt_email(order)
    @order = order
    @url  = 'http://jungle.com'
    mail(to: @order.email, subject: 'Thanks for your order @order.id' )
  end
end
