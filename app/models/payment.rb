# frozen_string_literal: true

# Payment
class Payment < ApplicationRecord
  belongs_to :reservation
  has_one_attached :file
  enum status: %i[pending approved rejected]
  translate_enum :status

  ALLOWED_FILE_TYPES = ['image/png', 'image/jpg', 'image/jpeg',
                        'application/pdf'].freeze

  STATUSES_TABLE_COLORS = {
    pending: :warning,
    approved: :success,
    rejected: :danger
  }.freeze

  validates :file, presence: true
  validates :file, attached: true, content_type: ALLOWED_FILE_TYPES
  before_create :set_amount
  after_create :notify_to_admin
  after_create :set_processing_payment_to_reservation
  after_update :change_vehicle_status
  after_update :notify_payment_success
  after_update :set_reservation_status

  def calculated_amount
    days = (reservation.end_date - reservation.start_date).to_i + 1
    fee_amount * days
  end

  def status_color
    STATUSES_TABLE_COLORS[status.to_sym]
  end

  private

  def change_vehicle_status
    reservation.vehicle.rented! if approved?
  end

  def set_reservation_status
    return reservation.reserved! if approved?

    reservation.rejected!
  end

  def set_processing_payment_to_reservation
    reservation.processing_payment!
  end

  def notify_payment_success
    return if pending?

    to = reservation.user.email
    mail = if approved?
             PaymentsMailer.payment_success(to, reservation)
           else
             PaymentsMailer.payment_rejected(to, reservation, comment)
           end
    mail.deliver_now!
  end

  def notify_to_admin
    PaymentsMailer.notify_create_to_admin(id, reservation.id).deliver_later
  end

  def set_amount
    self.amount = calculated_amount
  end

  def fee_amount
    reservation.vehicle.fee.amount
  end
end
