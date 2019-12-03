class LegalDocument < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_one_attached :file, dependent: :destroy

  enum document_types: ['circulation permit', 'obligatory insurance',
                        'technical review', 'vehicle register']
  enum status: %i[pending effective rejected expired]

  scope :active, -> { where(status: :effective) }
end
