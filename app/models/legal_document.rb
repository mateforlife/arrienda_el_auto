# frozen_string_literal: true

# legalDocument
class LegalDocument < ApplicationRecord
  # resource can be User or Vehicle or DriverAccount
  belongs_to :resource, polymorphic: true
  belongs_to :validator, class_name: 'User', foreign_key: 'validator_id',
                         optional: true
  has_many_attached :images, dependent: :purge_later

  enum document_type: %i[circulation_permit obligatory_insurance
                         technical_review vehicle_register identity
                         criminal_record driver_license driver_resume]
  enum status: %i[pending effective rejected expired]
  translate_enum :document_type
  translate_enum :status

  ALLOWED_FILE_TYPES = ['image/png', 'image/jpg', 'image/jpeg',
                        'application/pdf'].freeze
  ATTACHMENTS_LIMIT = 2
  STATUSES_TABLE_COLORS = {
    pending: :warning,
    effective: :success,
    rejected: :danger,
    expired: :danger
  }.freeze

  validates_length_of :images, in: 1..ATTACHMENTS_LIMIT, on: :create
  validates :images, attached: true, content_type: ALLOWED_FILE_TYPES
  validates :images, presence: true, on: :create
  validates :document_type, presence: true, on: :create
  validates :due_date, presence: true, on: :update
  validate :due_date_is_future

  after_save :set_status_for_resource,
             unless: :resource_is_user?
  after_update :check_ready_to_notify

  after_create :notify_admins, if: :resource_have_upload_all_documents?

  scope :active, -> { where(status: :effective) }

  scope :from_current_user_vehicles, lambda { |current_user|
    joins(
      <<-SQL
        INNER JOIN vehicles ON vehicles.id = legal_documents.resource_id
        AND legal_documents.resource_type = 'Vehicle'
      SQL
    ).where(vehicles: { user_id: current_user.id })
  }

  scope :from_current_user, lambda { |current_user|
    joins(
      <<-SQL
        INNER JOIN users ON users.id = legal_documents.resource_id
        AND legal_documents.resource_type = 'User'
      SQL
    ).where(users: { id: current_user.id })
  }

  scope :from_current_driver, lambda { |current_user|
    joins(
      <<-SQL
        INNER JOIN driver_accounts ON driver_accounts.id = legal_documents.resource_id
        AND legal_documents.resource_type = 'User'
      SQL
    ).where(driver_accounts: { user_id: current_user.id })
  }

  def status_color
    STATUSES_TABLE_COLORS[status.to_sym]
  end

  def self.translated_document(key)
    I18n.t(key,
           scope: 'activerecord.attributes.legal_document.document_type_list')
  end

  def resource_is_user?
    resource.class.to_s == 'User'
  end

  private

  def resource_have_upload_all_documents?
    resource.remaining_documents.empty?
  end

  def notify_admins
    LegalDocumentsMailer
      .all_documents_uploaded(set_user, resource).deliver_later
  end

  def check_ready_to_notify
    notify_documents_effective if resource.legal_documents_effective?
  end

  def notify_documents_effective
    resource_name = resource.class.to_s.underscore
    receiver = set_user

    LegalDocumentsMailer
      .documents_effective(resource_name, receiver).deliver_later
  end

  def set_user
    resource_is_user? ? resource : resource.user
  end

  def set_status_for_resource
    resource.set_status!
  end

  def resource_is_vehicle?
    resource.class.to_s == 'Vehicle'
  end

  def resource_is_driver_account?
    resource.class.to_s == 'DriverAccount'
  end

  def due_date_is_future
    return if due_date.blank?

    errors.add(:due_date, 'debe ser futura') if due_date <= Date.today
  end
end
