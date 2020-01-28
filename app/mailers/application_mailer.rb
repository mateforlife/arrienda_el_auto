# frozen_string_literal: true

# ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: 'webmaster@arriendaelauto.cl'
  layout 'mailer'
  layout 'bootstrap-mailer'
  before_action :set_admin_emails

  private

  def set_admin_emails
    @admin_emails = User.admins.pluck(:email)
  end
end
