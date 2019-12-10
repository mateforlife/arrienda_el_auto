# frozen_string_literal: true

# Notificable
module Notificable
  extend ActiveSupport::Concern

  included do
    after_update :check_ready_to_notify
  end

  def check_ready_to_notify
    notify_documents_effective if resource.legal_documents_effective?
  end

  def notify_documents_effective
    resource_name = resource.class.to_s
    to = resource&.email || resource.user.email

    LegalDocumentsMailer.documents_effective(resource_name, to).deliver_later
  end
end
