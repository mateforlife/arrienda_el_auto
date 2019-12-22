# frozen_string_literal: true

# legalDocument
class LegalDocument < ApplicationRecord
  include Notificable
  belongs_to :resource, polymorphic: true # resource can be User or Vehicle
  belongs_to :validator, class_name: 'User', foreign_key: 'validator_id',
                         optional: true
  has_many_attached :files, dependent: :destroy

  enum document_type: %i[circulation_permit obligatory_insurance
                         technical_review vehicle_register identity
                         criminal_record driver_license driver_resume]
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

  validates_length_of :attachments, in: 1..ATTACHMENTS_LIMIT, on: :create
  validates :attachments, presence: true, on: :create
  validates :document_type, presence: true, on: :create
  validates :due_date, presence: true, on: :update
  validate :due_date_is_future

  after_save :set_status_for_vehicle, if: :resource_is_vehicle?

  scope :active, -> { where(status: :effective) }
  scope :not_rejected, -> { where.not(status: 'rejected') }

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

  def self.resources_from_user(user)
    from_current_user_vehicles(user)
      .union(from_current_user(user)
        .union(from_current_driver(user)))
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

  def status_color
    STATUSES_TABLE_COLORS[status.to_sym]
  end

  def self.translated_document(key)
    I18n.t(key,
           scope: 'activerecord.attributes.legal_document.document_type_list')
  end

  private

  def set_status_for_vehicle
    resource.set_status!
  end

  def resource_is_vehicle?
    return true if resource.class.to_s == 'Vehicle'

    false
  end

  def due_date_is_future
    return if due_date.blank?

    errors.add(:due_date, 'debe ser futura') if due_date <= Date.today
  end
end
