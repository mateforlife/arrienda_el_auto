# frozen_string_literal: true

# Reservation
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_many :payments

  enum status: %i[waiting_payment processing_payment
                  reserved current finished rejected]
  translate_enum :status

  STATUSES_TABLE_COLORS = {
    waiting_payment: :warning,
    processing_payment: :warning,
    current: :success,
    reserved: :success,
    finished: :success,
    rejected: :danger
  }.freeze

  validates_presence_of %i[start_date end_date]
  validate :consistent_dates
  validate :user_must_have_active_driver_account
  validate :user_cannot_create_if_have_active_reservation, on: :create

  after_create :notify_created_reservation
  after_create :set_payment_wait_time
  after_update :change_vehicle_status
  before_destroy :check_status

  scope :current_and_future, lambda {
    where(status: %w[waiting_payment processing_payment
                     reserved current]).order('end_date DESC')
  }

  scope :current, lambda {
    where(status: 'current')
  }

  scope :reserved, -> { where(status: 'reserved') }

  def payment_effective?
    return false if payments.empty? || payments.last.rejected?

    true
  end

  def status_color
    STATUSES_TABLE_COLORS[status.to_sym]
  end

  private

  def change_vehicle_status
    return unless finished? && vehicle.reservations.current_and_future.empty?

    vehicle.published!
  end

  def user_cannot_create_if_have_active_reservation
    reservations = self.class.current_and_future
                       .where(vehicle_id: vehicle.id, user_id: user.id)
                       .where('date(created_at) = ?', Date.today)
    errors.add(:base, 'Ya posees una reserva activa') if reservations.present?
  end

  def notify_created_reservation
    driver = user
    vehicle_owner = vehicle.user
    reservation = self
    ReservationsMailer.created_for_owner(vehicle_owner,
                                         vehicle, reservation).deliver_later
    ReservationsMailer.created_for_driver(driver, vehicle,
                                          reservation).deliver_later
  end

  def check_status
    return if waiting_payment?

    errors.add(:base, 'No puedes eliminar esta reserva')
    throw :abort
  end

  def set_payment_wait_time
    CheckPaymentWorker.perform_in(2.hours, id)
  end

  def user_must_have_active_driver_account
    return if self.user&.driver_account&.approved?

    errors.add(:user_id, 'debe tener una cuenta de conductor,
               creala desde tu perfíl')
  end

  def consistent_dates
    return true if start_date <= end_date

    errors.add('intervalo de fechas inconsistente')
  end
end
