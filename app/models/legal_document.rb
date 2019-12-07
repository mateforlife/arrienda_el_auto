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

  # PERMITED_CONTENT_TYPES = %w[
  #   image/png image/jpg image/jpeg application/pdf
  # ].freeze

  validates_length_of :attachments, is: ATTACHMENTS_LIMIT, on: :create
  validates :attachments, presence: true, on: :create
  validates :document_type, presence: true, on: :create
  validates :due_date, presence: true, on: :update

  scope :active, -> { where(status: :effective) }
  scope :not_rejected, -> { where.not(status: 'rejected') }

  def status_color
    STATUSES_TABLE_COLORS[status.to_sym]
  end

  def save_with_images
    ActiveRecord::Base.transaction do
      begin
        save!
        files.attach(attachments)
        files.each(&:save!)
      rescue ActiveRecord::RecordInvalid => e
        errors.add(:attachments, e)
        raise ActiveRecord::Rollback
      rescue StandardError => e
        errors.add(:attachments, e)
        raise ActiveRecord::Rollback
      end
      true
    end
  end

  def self.translated_document(key)
    I18n.t(key,
           scope: 'activerecord.attributes.legal_document.document_type_list')
  end
end
