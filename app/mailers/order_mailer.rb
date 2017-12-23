class OrderMailer < ActionMailer::Base
  default from: "ror.test.e@gmail.com"

  def send_email(order)
  	@order = order
  	emails = ['sergey12vn@gmail.com', 'nakul.sv@gmail.com'] # два сотрудника
  	mail to: emails, 
  	# bcc: 'admin@gmail.com', 
  	subject: 'Запос стоимости билета'
  end
end
