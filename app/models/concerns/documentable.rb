module Documentable
  extend ActiveSupport::Concern

  included do
    has_many :legal_documents, as: :resource, dependent: :destroy
  end

  def remaining_documents
    all_documents = LegalDocument.document_types.deep_dup
    current_documents = legal_documents.not_rejected&.pluck(:document_type)
    documents_difference = (all_documents.keys - self.class::REQUIRED_DOCUMENTS)
    documents_difference.concat(current_documents)
    documents_difference.each do |document|
      all_documents.except!(document)
    end
    all_documents
  end
end
