class LegalDocument < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_many_attached :files, dependent: :destroy

  enum document_type: %i[circulation_permit obligatory_insurance
                         technical_review vehicle_register identity]
  enum status: %i[pending effective rejected expired]

  attr_accessor :attachments

  ATTACHMENTS_LIMIT = 2

  validates_length_of :attachments, is: ATTACHMENTS_LIMIT, on: :create
  validates :attachments, presence: true, on: :create
  validates :document_type, presence: true, on: :create

  scope :active, -> { where(status: :effective) }

  def save_with_images
    ActiveRecord::Base.transaction do
      return false unless save

      files.attach(attachments)
    rescue ActiveRecord::RecordInvalid => e
      errors.add(:attachments, e)
      raise ActiveRecord::Rollback
    end
    true
  end
end
