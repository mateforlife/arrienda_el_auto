# frozen_string_literal: true

# app/mailers/devise_mailer.rb
class DeviseMailer < Devise::Mailer
  # to make sure that your mailer uses the devise views
  default template_path: 'devise/mailer'
  layout 'mailer'

  # gives access to all helpers defined within `application_helper`.
  helper :application

  def reset_password_instructions(record, token, opts={})
    @token = token
    @resource = record
    mail(
      template_path: 'devise/mailer',
      from: 'notificaciones@arriendaelauto.cl',
      to: record.email, cc: '',
      subject: 'reset password instructions')
  end

  def confirmation_instructions(record, token, opts={})
    @token = token
    @resource = record
    mail(
      template_path: 'devise/mailer',
      from: 'notificaciones@arriendaelauto.cl',
      to: record.email, cc: '',
      subject: 'confirmation instructions')
  end
end
