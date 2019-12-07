class LegalDocument < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_many_attached :files, dependent: :destroy

  enum document_type: %i[circulation_permit obligatory_insurance
                         technical_review vehicle_register identity]
  enum status: %i[pending effective rejected expired]
  translate_enum :document_type
  translate_enum :status

  attr_accessor :attachments

  ATTACHMENTS_LIMIT = 2
  STATUSES_TABLE_COLORS = {
    pending: :warning,
    effective: :success,
    rejected: :danger,
    expired: :danger
  }.freeze

  validates_length_of :attachments, is: ATTACHMENTS_LIMIT, on: :create
  validates :attachments, presence: true, on: :create
  validates :document_type, presence: true, on: :create

  scope :active, -> { where(status: :effective) }

  def status_color
    STATUSES_TABLE_COLORS[status.to_sym]
  end

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

  def self.translated_document(key)
    I18n.t(key, scope: 'activerecord.attributes.legal_document.document_type_list')
  end
end
