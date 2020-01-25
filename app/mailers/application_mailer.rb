class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid
  default from: 'webmaster@arriendaelauto.cl'
  layout 'mailer'

  def test_mail
    mail(to: 'rodriguez.ruiz.alex@gmail.com', cc: '',
         subject: 'asuntito')
  end

  def sendgrid_mail
    from = SendGrid::Email.new(email: 'webmaster@arriendaelauto.cl')
    to = SendGrid::Email.new(email: 'rodriguez.ruiz.alex@gmail.com')
    subject = 'Sending with Twilio SendGrid is Fun'
    content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response
  end

  def set_admin_emails
    @admin_emails = User.admins.pluck(:email)
  end
end
