# frozen_string_literal: true

# LegalDocumentsMailer
class LegalDocumentsMailer < ApplicationMailer
  default from: 'notificaciones@easy-car.cl'
  layout 'mailer'

  def documents_effective(resource_name, to)
    resource_name.downcase!
    mail(to: to, cc: 'acrodriguez@protonmail.com',
         subject: "Documentos de #{resource_name} validados",
         template: "#{resource_name}_documents")
  end
end
