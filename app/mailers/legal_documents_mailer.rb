# frozen_string_literal: true

# LegalDocumentsMailer
class LegalDocumentsMailer < ApplicationMailer
  include MailHelper
  default from: 'notificaciones@arriendaelauto.cl'
  layout 'mailer'

  def documents_effective(resource_name, receiver)
    resource_name.downcase!
    @resource_name = resource_name
    @name = receiver.first_name
    mail(to: receiver.email, cc: @admin_emails,
         subject: "Documentos de
                   #{I18n.t("resources.#{resource_name}")} validados")
  end

  def all_documents_uploaded(user, resource)
    resource_name = resource.class.to_s.underscore
    @resource = resource
    @user = user
    @translated_name = I18n.t("resources.#{resource_name}")
    @url = generate_resource_edit_url(@resource, resource_name)
    mail(to: @admin_emails,
         subject: "Validación de documentos de
                   #{@resource_name}")
  end
end
