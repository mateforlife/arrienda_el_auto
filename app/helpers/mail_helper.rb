# frozen_string_literal: true

# MailHelper
module MailHelper
  def generate_resource_edit_url(resource, resource_name)
    case resource_name
    when 'user'
      user_legal_documents_url(user_id: resource)
    when 'vehicle'
      vehicle_legal_documents_url(vehicle_id: resource)
    when 'driver_account'
      driver_account_legal_documents_url(driver_account_id: resource)
    end
  end
end
