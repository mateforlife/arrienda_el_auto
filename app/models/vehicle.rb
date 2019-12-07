# frozen_string_literal: true

# Vehicle
class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :user
  belongs_to :fee, required: false
  has_many :profile_images, as: :resource, dependent: :destroy
  has_many :legal_documents, as: :resource, dependent: :destroy
  accepts_nested_attributes_for :profile_images
  attr_accessor :images

  REQUIRED_DOCUMENTS = %w[circulation_permit obligatory_insurance
                          technical_review vehicle_register].freeze

  # ====================
  # =     ENUMS        =
  # ====================
  enum body_type: %i[citycar sedan]
  enum engine_type: %i[gasoline diesel]
  enum transmission: %i[manual automatic]
  enum steering: %i[mechanical power electric hydraulic]
  enum drive: %w[4x2 4x4]
  translate_enum :body_type
  translate_enum :engine_type
  translate_enum :transmission
  translate_enum :steering

  # ====================
  # =   VALIDATORS     =
  # ====================
  validates_presence_of %i[year license_plate engine_number
                           chasis_number]
  validates :year, length: { is: 4 }
  validates :license_plate, length: { is: 6 }
  validates :odometer, length: { in: 1..7 }
  validates_length_of :images, maximum: ProfileImage::ATTACHMENTS_LIMIT
  validates :images, presence: true, on: :create

  # ====================
  # =    CALLBACKS     =
  # ====================
  before_create :associate_fee
  before_save :upcase_license_plate
  before_update :update_images

  # ====================
  # =      SCOPES      =
  # ====================
  scope :available, -> { where(visible: true) }
  scope :not_from_current_user, lambda { |current_user|
    where.not(user: current_user)
  }

  # ====================
  # = INSTANCE METHODS =
  # ====================

  def remaining_documents
    all_documents = LegalDocument.document_types.deep_dup
    current_documents = legal_documents.not_rejected&.pluck(:document_type)
    documents_difference = (all_documents.keys - REQUIRED_DOCUMENTS)
    documents_difference.concat(current_documents)
    documents_difference.each do |document|
      all_documents.except!(document)
    end
    all_documents
  end

  def legal_status_badge
    if legal_documents_effective?
      text = I18n.t('vehicle.legal_status.effective')
      badge_color = 'success'
    else
      text = I18n.t('vehicle.legal_status.pending')
      badge_color = 'danger'
    end
    { text: text, badge_color: badge_color }
  end

  def legal_documents_effective?
    return false if legal_documents.empty?

    legal_documents.active&.pluck(:document_type)&.sort == REQUIRED_DOCUMENTS
  end

  def update_images
    images&.each do |image|
      if images_full?
        errors.add(:images, :limit_exceded)
        raise ActiveRecord::Rollback
      end
      profile_images.create!(file: image)
    rescue ActiveRecord::RecordInvalid
      errors.add(:images, :record_invalid)
      raise ActiveRecord::Rollback
    end
  end

  def images_full?
    profile_images.size >= ProfileImage::ATTACHMENTS_LIMIT
  end

  def upcase_license_plate
    self.license_plate = license_plate.upcase
  end

  def belongs_to_current_user?(current_user)
    user == current_user
  end

  def brand_and_model
    "#{vehicle_model.brand.name} #{vehicle_model.name}"
  end

  def brand_model_and_year
    "#{vehicle_model.brand.name} #{vehicle_model.name} - #{year}"
  end

  def save_with_images
    ActiveRecord::Base.transaction do
      return false unless save

      images.each do |image|
        profile_images.create!(file: image)
      rescue ActiveRecord::RecordInvalid => e
        errors.add(:images, e)
        raise ActiveRecord::Rollback
      end
      true
    end
  end

  def associate_fee
    fee = Fee.find_by(body_type: body_type, engine_type: engine_type)
    return errors.add(:fee, 'does not exist for your vehicle') if fee.nil?

    self.fee = fee
  end

  # ====================
  # =  CLASS METHODS   =
  # ====================
  def self.search(params)
    params.downcase!
    base_query = Vehicle.joins(vehicle_model: :brand)
    base_query.where(vehicle_models: { name: params })
              .or(base_query.where('lower(vehicle_models.name) LIKE ?', "%#{params}"))
              .or(base_query.where('lower(vehicle_models.name) LIKE ?', "#{params}%"))
              .or(base_query.where('lower(vehicle_models.name) LIKE ?', "%#{params}%"))
              .or(base_query.where('lower(brands.name) = ?', params))
              .or(base_query.where('lower(brands.name) LIKE ?', "%#{params}"))
              .or(base_query.where('lower(brands.name) LIKE ?', "#{params}%"))
              .or(base_query.where('lower(brands.name) LIKE ?', "%#{params}%"))
  end
end
