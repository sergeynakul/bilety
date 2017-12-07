class OrderMailer < ActionMailer::Base
  default from: "sergey12vn@gmail.com"

  def send_email(order)
  	@order = order

  	mail to: "nakul.sv@gmail.com", subject: 'Запос стоимости билета'
  end
end
