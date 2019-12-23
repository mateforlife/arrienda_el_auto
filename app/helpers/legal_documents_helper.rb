# frozen_string_literal: true

# LegalDocumentsHelper
module LegalDocumentsHelper
  def image_size(width = 740, height = 460)
    [width, height]
  end

  def document_types
    'image/png,image/jpg,image/jpeg,application/pdf'
  end

  def legal_documents_path(resource)
    if resource.class == Vehicle
      vehicle_legal_documents_path(resource)
    elsif resource.class == User
      user_legal_documents_path(resource)
    end
  end

  def legal_document_path(legal_document)
    resource = legal_document.resource
    if resource.class == Vehicle
      vehicle_legal_document_path(resource, legal_document)
    elsif resource.class == User
      user_legal_document_path(resource, legal_document)
    end
  end

  def new_legal_document_path(params)
    if params[:vehicle_id]
      new_vehicle_legal_document_path(params[:vehicle_id])
    elsif params[:user_id]
      new_user_legal_document_path(params[:user_id])
    end
  end

  def edit_legal_document_path(legal_document)
    resource = legal_document.resource
    if resource.class == Vehicle
      edit_vehicle_legal_document_path(resource, legal_document)
    elsif resource.class == User
      edit_user_legal_document_path(resource, legal_document)
    end
  end
end
