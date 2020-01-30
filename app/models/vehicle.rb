# frozen_string_literal: true

# Vehicle
class Vehicle < ApplicationRecord
  acts_as_paranoid
  include Documentable
  belongs_to :vehicle_model
  belongs_to :user
  belongs_to :fee, required: false
  has_many :reservations, dependent: :destroy
  has_many_attached :images

  ATTACHMENTS_LIMIT = 5
  REQUIRED_DOCUMENTS = %w[circulation_permit].freeze
  ALLOWED_FILE_TYPES = ['image/png', 'image/jpg', 'image/jpeg'].freeze
  STATUSES_TABLE_COLORS = {
    created: :info,
    review: :danger,
    ready: :success,
    published: :success,
    rented: :info,
    disabled: :warning
  }.freeze

  # ====================
  # =     ENUMS        =
  # ====================
  enum body_type: %i[citycar sedan]
  enum engine_type: %i[gasoline diesel]
  enum transmission: %i[manual automatic]
  enum steering: %i[mechanical power electric hydraulic]
  enum drive: %w[4x2 4x4]
  enum status: %i[created review ready published rented disabled temp_disabled]
  translate_enum :body_type
  translate_enum :engine_type
  translate_enum :transmission
  translate_enum :steering
  translate_enum :status

  # ====================
  # =   VALIDATORS     =
  # ====================
  validates_presence_of %i[year license_plate engine_number
                           chasis_number]
  validates :year, length: { is: 4 }
  validates :license_plate, length: { is: 6 }
  validates :odometer, length: { in: 1..7 }
  validates_length_of :images, maximum: ATTACHMENTS_LIMIT
  validates :images, presence: true, on: :create
  validates :images, attached: true, content_type: ALLOWED_FILE_TYPES
  validate :active_reservations, on: :update, if: :disabled?

  # ====================
  # =    CALLBACKS     =
  # ====================
  before_create :associate_fee
  before_save :upcase_license_plate

  # ====================
  # =      SCOPES      =
  # ====================
  scope :not_from_current_user, lambda { |current_user|
    where.not(user: current_user)
  }
  scope :available, -> { where(status: %w[published rented]) }

  # ====================
  # = INSTANCE METHODS =
  # ====================

  # return sugested start date to reservation
  def reservation_start_date
    reservations.current_and_future&.first&.end_date || Date.today
  end

  def set_status!
    return ready! if legal_documents_effective? && (review? || status.nil?)

    return review! if created? || status.nil?
  end

  def legal_status_badge
    badge_color = STATUSES_TABLE_COLORS[status.to_sym]
    { text: status, badge_color: badge_color }
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

  def disable
    if reservations.current_and_future.present? || disabled? || temp_disabled?
      return false
    end

    disabled!
  rescue ActiveRecord::ActiveRecordError
    false
  end

  def back_to_status
    return created! if legal_documents.empty?
    return review! unless legal_documents_effective?
    return published! if temp_disabled?

    ready!
  rescue ActiveRecord::ActiveRecordError
    false
  end

  def temporal_disable(user)
    temp_disabled!
    time_to_create_reservation(user)
  rescue StandardError => e
    puts e
    false
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
  # ====================
  # =     PRIVATE      =
  # ====================

  private

  def time_to_create_reservation(user)
    ReservationDeadlineWorker
      .perform_in(Reservation::DEADLINE_TO_CREATE, id, user.id)
  end

  def active_reservations
    return true if reservations.current_and_future.empty?

    errors.add(:base, 'No puede desactivar vehículo,
                         ya que posee reservas activas')
    false
  end

  def upcase_license_plate
    self.license_plate = license_plate.upcase
  end

  def associate_fee
    fee = Fee.find_by(body_type: body_type, engine_type: engine_type)
    return errors.add(:fee, 'does not exist for your vehicle') if fee.nil?

    self.fee = fee
  end
end
