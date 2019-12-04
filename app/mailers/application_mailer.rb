class ApplicationMailer < ActionMailer::Base
  include SendGrid
  default from: 'root@easycar.cl'
  layout 'mailer'

  def test_mail
    mail(to: 'rodriguez.ruiz.alex@gmail.com', cc: '',
         subject: 'asuntito')
  end
end
