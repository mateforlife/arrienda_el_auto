# frozen_string_literal: true

# Documentable
module Documentable
  extend ActiveSupport::Concern

  included do
    has_many :legal_documents, as: :resource, dependent: :destroy

    scope :pending_document_validation, lambda {
      joins(:legal_documents)
        .where(legal_documents: { status: :pending }).distinct
    }
  end

  def legal_documents_effective?
    return false if legal_documents.empty?

    legal_documents.active
                  &.pluck(:document_type)
                  &.sort == self.class::REQUIRED_DOCUMENTS
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
