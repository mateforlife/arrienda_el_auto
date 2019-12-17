class DeviseMailer < Devise::Mailer
  default template_path: 'devise/mailer'
  # gives access to all helpers defined within `application_helper`.
  helper :application
  def reset_password_instructions(record, token, opts={})
    @token = token
    @resource = record
    # Custom logic to send the email with MJML
    mail(
      template_path: 'devise/mailer',
      from: 'notificaciones@easy-car.cl',
      to: 'rodriguez.ruiz.alex@gmail.com', cc: '',
      subject: "Custom subject"
    ) do |format|
      format.text
      format.mjml
    end
  end
end
